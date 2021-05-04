; ModuleID = 'a.c'
source_filename = "a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = dso_local global i32 0, align 4
@r = dso_local global i32 10, align 4


; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo2() #0 {
entry:
  %retval = alloca i32, align 4
  %__ANOMY_0 = load i32, i32* @r, align 4
  switch i32 %__ANOMY_0, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry
  %__ANOMY_1 = load i32, i32* @r, align 4
  store i32 %__ANOMY_1, i32* %retval, align 4
  br label %return

sw.bb1:                                           ; preds = %entry
  %__ANOMY_2 = load i32, i32* @a, align 4
  %add = add nsw i32 %__ANOMY_2, 1
  store i32 %add, i32* @r, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %__ANOMY_3 = load i32, i32* @r, align 4
  %add2 = add nsw i32 %__ANOMY_3, 2
  store i32 %add2, i32* @a, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb1
  %__ANOMY_4 = load i32, i32* @r, align 4
  store i32 %__ANOMY_4, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb
  %__ANOMY_5 = load i32, i32* %retval, align 4
  ret i32 %__ANOMY_5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo() #0 {
entry:
  %retval = alloca i32, align 4
  %__ANOMY_0 = load i32, i32* @a, align 4
  %cmp = icmp sgt i32 %__ANOMY_0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %__ANOMY_1 = load i32, i32* @a, align 4
  %add = add nsw i32 %__ANOMY_1, 1
  store i32 %add, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %__ANOMY_2 = load i32, i32* @a, align 4
  %cmp1 = icmp slt i32 %__ANOMY_2, -7
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  store i32 -3, i32* %retval, align 4
  br label %return

if.else3:                                         ; preds = %if.else
  %__ANOMY_3 = load i32, i32* @a, align 4
  store i32 %__ANOMY_3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %__ANOMY_4 = load i32, i32* %retval, align 4
  ret i32 %__ANOMY_4
}


attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.1 (https://github.com/llvm/llvm-project 43ff75f2c3feef64f9d73328230d34dac8832a91)"}