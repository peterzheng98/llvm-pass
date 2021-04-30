; ModuleID = 'proxy.c'
source_filename = "proxy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.sockaddr = type { i16, [14 x i8] }
%struct.sctp_initmsg = type { i16, i16, i16, i16 }
%struct.sctp_event_subscribe = type { i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.server_info = type { %struct.sockaddr*, i32 }
%struct.proxy_info = type { i32, i32, i32, i32, %struct.sockaddr*, i32, %struct.sockaddr*, i32, i8*, i64, i64, i8*, i64, i64 }
%union.pthread_attr_t = type { i64, [48 x i8] }
%struct.addrinfo = type { i32, i32, i32, i32, i32, %struct.sockaddr*, i8*, %struct.addrinfo* }
%struct.fd_set = type { [16 x i64] }
%struct.sctp_sndrcvinfo = type { i16, i16, i16, i32, i32, i32, i32, i32, i32 }
%struct.sctp_status = type { i32, i32, i32, i16, i16, i16, i16, i32, %struct.sctp_paddrinfo }
%struct.sctp_paddrinfo = type <{ i32, %struct.sockaddr_storage, i32, i32, i32, i32, i32 }>
%struct.sockaddr_storage = type { i16, [118 x i8], i64 }
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [13 x i8] c"i:L:o:S:X:46\00", align 1
@optarg = external dso_local global i8*, align 8
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [42 x i8] c"number of incoming streams out of range.\0A\00", align 1
@.str.2 = private unnamed_addr constant [55 x i8] c"addresses to be listening on provided multiple times.\0A\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"number of outgoing streams out of range.\0A\00", align 1
@.str.4 = private unnamed_addr constant [59 x i8] c"addresses to be uses as a client provided multiple times.\0A\00", align 1
@.str.5 = private unnamed_addr constant [40 x i8] c"-4 and -6 can't be specified together.\0A\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.7 = private unnamed_addr constant [17 x i8] c"Unknown option.\0A\00", align 1
@.str.8 = private unnamed_addr constant [38 x i8] c"Can't open the listening socket: %s.\0A\00", align 1
@.str.9 = private unnamed_addr constant [50 x i8] c"Can't set the listening socket to IPv6 only: %s.\0A\00", align 1
@.str.10 = private unnamed_addr constant [38 x i8] c"Can't set the number of streams: %s.\0A\00", align 1
@.str.11 = private unnamed_addr constant [45 x i8] c"proxy: Can't subscribe to data_io event: %s\0A\00", align 1
@.str.12 = private unnamed_addr constant [38 x i8] c"Can't bind the listening socket: %s.\0A\00", align 1
@.str.13 = private unnamed_addr constant [54 x i8] c"No valid local addresses to listen on are specified.\0A\00", align 1
@.str.14 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.15 = private unnamed_addr constant [58 x i8] c"No local addresses to be used as a client are specified.\0A\00", align 1
@.str.16 = private unnamed_addr constant [52 x i8] c"No valid remote addresses specified for server %d.\0A\00", align 1
@.str.17 = private unnamed_addr constant [57 x i8] c"Can't set the listening socket to the LISTEN state: %s.\0A\00", align 1
@.str.18 = private unnamed_addr constant [37 x i8] c"Couldn't accept an association: %s.\0A\00", align 1
@.str.19 = private unnamed_addr constant [26 x i8] c"Couldn't start a thread.\0A\00", align 1
@.str.20 = private unnamed_addr constant [2 x i8] c",\00", align 1
@select_a_server.i = internal global i32 0, align 4
@.str.21 = private unnamed_addr constant [40 x i8] c"proxy: Can't get number of streams: %s\0A\00", align 1
@.str.22 = private unnamed_addr constant [59 x i8] c"proxy: Can't allocate memory for messages from the client\0A\00", align 1
@.str.23 = private unnamed_addr constant [59 x i8] c"proxy: Can't allocate memory for messages from the server\0A\00", align 1
@.str.24 = private unnamed_addr constant [32 x i8] c"proxy: Can't open a socket: %s\0A\00", align 1
@.str.25 = private unnamed_addr constant [32 x i8] c"proxy: Can't set IPV6 mode: %s\0A\00", align 1
@.str.26 = private unnamed_addr constant [45 x i8] c"proxy: Can't set the number of streams: %s.\0A\00", align 1
@.str.27 = private unnamed_addr constant [39 x i8] c"proxy: Can't bind local addresses: %s\0A\00", align 1
@.str.28 = private unnamed_addr constant [36 x i8] c"proxy: Can't connect to server: %s\0A\00", align 1
@.str.29 = private unnamed_addr constant [25 x i8] c"proxy: sctp_recvmsg: %s\0A\00", align 1
@.str.30 = private unnamed_addr constant [25 x i8] c"proxy: sctp_sendmsg: %s\0A\00", align 1
@.str.31 = private unnamed_addr constant [62 x i8] c"proxy: Can't re-allocate memory for messages from the client\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %fd = alloca i32, align 4
  %local_addrs = alloca %struct.sockaddr*, align 8
  %number_local_addrs = alloca i32, align 4
  %tid = alloca i64, align 8
  %c = alloca i32, align 4
  %ipv4only = alloca i32, align 4
  %ipv6only = alloca i32, align 4
  %i_streams = alloca i16, align 2
  %o_streams = alloca i16, align 2
  %initmsg = alloca %struct.sctp_initmsg, align 2
  %events = alloca %struct.sctp_event_subscribe, align 1
  %value = alloca i64, align 8
  %number_servers = alloca i32, align 4
  %i = alloca i32, align 4
  %server_infos = alloca %struct.server_info*, align 8
  %server_info = alloca %struct.server_info*, align 8
  %L_arg = alloca i8*, align 8
  %X_arg = alloca i8*, align 8
  %S_args = alloca i8**, align 8
  %proxy_info = alloca %struct.proxy_info*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %ipv4only, align 4
  store i32 0, i32* %ipv6only, align 4
  store i16 1, i16* %i_streams, align 2
  store i16 1, i16* %o_streams, align 2
  store i8* null, i8** %L_arg, align 8
  store i8* null, i8** %X_arg, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %conv = sext i32 %0 to i64
  %call = call noalias i8* @calloc(i64 %conv, i64 8) #7
  %1 = bitcast i8* %call to i8**
  store i8** %1, i8*** %S_args, align 8
  store i32 0, i32* %number_servers, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %2 = load i32, i32* %argc.addr, align 4
  %3 = load i8**, i8*** %argv.addr, align 8
  %call1 = call i32 @getopt(i32 %2, i8** %3, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)) #7
  store i32 %call1, i32* %c, align 4
  %cmp = icmp ne i32 %call1, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* %c, align 4
  switch i32 %4, label %sw.default [
    i32 105, label %sw.bb
    i32 76, label %sw.bb10
    i32 111, label %sw.bb17
    i32 83, label %sw.bb29
    i32 88, label %sw.bb30
    i32 52, label %sw.bb37
    i32 54, label %sw.bb41
  ]

sw.bb:                                            ; preds = %while.body
  %5 = load i8*, i8** @optarg, align 8
  %call3 = call i64 @strtol(i8* %5, i8** null, i32 10) #7
  store i64 %call3, i64* %value, align 8
  %6 = load i64, i64* %value, align 8
  %cmp4 = icmp slt i64 0, %6
  br i1 %cmp4, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %sw.bb
  %7 = load i64, i64* %value, align 8
  %cmp6 = icmp slt i64 %7, 65536
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %8 = load i64, i64* %value, align 8
  %conv8 = trunc i64 %8 to i16
  store i16 %conv8, i16* %i_streams, align 2
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %sw.bb
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.1, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  br label %sw.epilog

sw.bb10:                                          ; preds = %while.body
  %10 = load i8*, i8** %L_arg, align 8
  %cmp11 = icmp ne i8* %10, null
  br i1 %cmp11, label %if.then13, label %if.else15

if.then13:                                        ; preds = %sw.bb10
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.2, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.else15:                                        ; preds = %sw.bb10
  %12 = load i8*, i8** @optarg, align 8
  store i8* %12, i8** %L_arg, align 8
  br label %if.end16

if.end16:                                         ; preds = %if.else15
  br label %sw.epilog

sw.bb17:                                          ; preds = %while.body
  %13 = load i8*, i8** @optarg, align 8
  %call18 = call i64 @strtol(i8* %13, i8** null, i32 10) #7
  store i64 %call18, i64* %value, align 8
  %14 = load i64, i64* %value, align 8
  %cmp19 = icmp slt i64 0, %14
  br i1 %cmp19, label %land.lhs.true21, label %if.else26

land.lhs.true21:                                  ; preds = %sw.bb17
  %15 = load i64, i64* %value, align 8
  %cmp22 = icmp slt i64 %15, 65536
  br i1 %cmp22, label %if.then24, label %if.else26

if.then24:                                        ; preds = %land.lhs.true21
  %16 = load i64, i64* %value, align 8
  %conv25 = trunc i64 %16 to i16
  store i16 %conv25, i16* %o_streams, align 2
  br label %if.end28

if.else26:                                        ; preds = %land.lhs.true21, %sw.bb17
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end28:                                         ; preds = %if.then24
  br label %sw.epilog

sw.bb29:                                          ; preds = %while.body
  %18 = load i8*, i8** @optarg, align 8
  %19 = load i8**, i8*** %S_args, align 8
  %20 = load i32, i32* %number_servers, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %number_servers, align 4
  %idxprom = sext i32 %20 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %19, i64 %idxprom
  store i8* %18, i8** %arrayidx, align 8
  br label %sw.epilog

sw.bb30:                                          ; preds = %while.body
  %21 = load i8*, i8** %X_arg, align 8
  %cmp31 = icmp ne i8* %21, null
  br i1 %cmp31, label %if.then33, label %if.else35

if.then33:                                        ; preds = %sw.bb30
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.4, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.else35:                                        ; preds = %sw.bb30
  %23 = load i8*, i8** @optarg, align 8
  store i8* %23, i8** %X_arg, align 8
  br label %if.end36

if.end36:                                         ; preds = %if.else35
  br label %sw.epilog

sw.bb37:                                          ; preds = %while.body
  store i32 1, i32* %ipv4only, align 4
  %24 = load i32, i32* %ipv6only, align 4
  %tobool = icmp ne i32 %24, 0
  br i1 %tobool, label %if.then38, label %if.end40

if.then38:                                        ; preds = %sw.bb37
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.5, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end40:                                         ; preds = %sw.bb37
  br label %sw.epilog

sw.bb41:                                          ; preds = %while.body
  store i32 1, i32* %ipv6only, align 4
  %26 = load i32, i32* %ipv4only, align 4
  %tobool42 = icmp ne i32 %26, 0
  br i1 %tobool42, label %if.then43, label %if.end45

if.then43:                                        ; preds = %sw.bb41
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.5, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end45:                                         ; preds = %sw.bb41
  br label %sw.epilog

sw.default:                                       ; preds = %while.body
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call46 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.7, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %if.end45, %if.end40, %if.end36, %sw.bb29, %if.end28, %if.end16, %if.end
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %29 = load i32, i32* %ipv4only, align 4
  %tobool47 = icmp ne i32 %29, 0
  %30 = zext i1 %tobool47 to i64
  %cond = select i1 %tobool47, i32 2, i32 10
  %call48 = call i32 @socket(i32 %cond, i32 1, i32 132) #7
  store i32 %call48, i32* %fd, align 4
  %cmp49 = icmp slt i32 %call48, 0
  br i1 %cmp49, label %if.then51, label %if.end55

if.then51:                                        ; preds = %while.end
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call52 = call i32* @__errno_location() #8
  %32 = load i32, i32* %call52, align 4
  %call53 = call i8* @strerror(i32 %32) #7
  %call54 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.8, i64 0, i64 0), i8* %call53)
  store i32 1, i32* %retval, align 4
  br label %return

if.end55:                                         ; preds = %while.end
  %33 = load i32, i32* %ipv4only, align 4
  %tobool56 = icmp ne i32 %33, 0
  br i1 %tobool56, label %if.end66, label %if.then57

if.then57:                                        ; preds = %if.end55
  %34 = load i32, i32* %fd, align 4
  %35 = bitcast i32* %ipv6only to i8*
  %call58 = call i32 @setsockopt(i32 %34, i32 41, i32 26, i8* %35, i32 4) #7
  %cmp59 = icmp slt i32 %call58, 0
  br i1 %cmp59, label %if.then61, label %if.end65

if.then61:                                        ; preds = %if.then57
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call62 = call i32* @__errno_location() #8
  %37 = load i32, i32* %call62, align 4
  %call63 = call i8* @strerror(i32 %37) #7
  %call64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.9, i64 0, i64 0), i8* %call63)
  br label %if.end65

if.end65:                                         ; preds = %if.then61, %if.then57
  br label %if.end66

if.end66:                                         ; preds = %if.end65, %if.end55
  %38 = bitcast %struct.sctp_initmsg* %initmsg to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %38, i8 0, i64 8, i1 false)
  %39 = load i16, i16* %o_streams, align 2
  %sinit_num_ostreams = getelementptr inbounds %struct.sctp_initmsg, %struct.sctp_initmsg* %initmsg, i32 0, i32 0
  store i16 %39, i16* %sinit_num_ostreams, align 2
  %40 = load i16, i16* %i_streams, align 2
  %sinit_max_instreams = getelementptr inbounds %struct.sctp_initmsg, %struct.sctp_initmsg* %initmsg, i32 0, i32 1
  store i16 %40, i16* %sinit_max_instreams, align 2
  %41 = load i32, i32* %fd, align 4
  %42 = bitcast %struct.sctp_initmsg* %initmsg to i8*
  %call67 = call i32 @setsockopt(i32 %41, i32 132, i32 2, i8* %42, i32 8) #7
  %cmp68 = icmp slt i32 %call67, 0
  br i1 %cmp68, label %if.then70, label %if.end74

if.then70:                                        ; preds = %if.end66
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call71 = call i32* @__errno_location() #8
  %44 = load i32, i32* %call71, align 4
  %call72 = call i8* @strerror(i32 %44) #7
  %call73 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.10, i64 0, i64 0), i8* %call72)
  store i32 1, i32* %retval, align 4
  br label %return

if.end74:                                         ; preds = %if.end66
  %45 = bitcast %struct.sctp_event_subscribe* %events to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %45, i8 0, i64 13, i1 false)
  %sctp_data_io_event = getelementptr inbounds %struct.sctp_event_subscribe, %struct.sctp_event_subscribe* %events, i32 0, i32 0
  store i8 1, i8* %sctp_data_io_event, align 1
  %46 = load i32, i32* %fd, align 4
  %47 = bitcast %struct.sctp_event_subscribe* %events to i8*
  %call75 = call i32 @setsockopt(i32 %46, i32 132, i32 11, i8* %47, i32 13) #7
  %cmp76 = icmp slt i32 %call75, 0
  br i1 %cmp76, label %if.then78, label %if.end82

if.then78:                                        ; preds = %if.end74
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call79 = call i32* @__errno_location() #8
  %49 = load i32, i32* %call79, align 4
  %call80 = call i8* @strerror(i32 %49) #7
  %call81 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.11, i64 0, i64 0), i8* %call80)
  store i32 1, i32* %retval, align 4
  br label %return

if.end82:                                         ; preds = %if.end74
  %50 = load i8*, i8** %L_arg, align 8
  %51 = load i32, i32* %ipv4only, align 4
  %52 = load i32, i32* %ipv6only, align 4
  %call83 = call i32 @parse_addrs_list_port(i8* %50, i32 %51, i32 %52, %struct.sockaddr** %local_addrs)
  store i32 %call83, i32* %number_local_addrs, align 4
  %53 = load i32, i32* %number_local_addrs, align 4
  %cmp84 = icmp sgt i32 %53, 0
  br i1 %cmp84, label %if.then86, label %if.else95

if.then86:                                        ; preds = %if.end82
  %54 = load i32, i32* %fd, align 4
  %55 = load %struct.sockaddr*, %struct.sockaddr** %local_addrs, align 8
  %56 = load i32, i32* %number_local_addrs, align 4
  %call87 = call i32 @sctp_bindx(i32 %54, %struct.sockaddr* %55, i32 %56, i32 1)
  %cmp88 = icmp slt i32 %call87, 0
  br i1 %cmp88, label %if.then90, label %if.end94

if.then90:                                        ; preds = %if.then86
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call91 = call i32* @__errno_location() #8
  %58 = load i32, i32* %call91, align 4
  %call92 = call i8* @strerror(i32 %58) #7
  %call93 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.12, i64 0, i64 0), i8* %call92)
  store i32 1, i32* %retval, align 4
  br label %return

if.end94:                                         ; preds = %if.then86
  %59 = load %struct.sockaddr*, %struct.sockaddr** %local_addrs, align 8
  %60 = bitcast %struct.sockaddr* %59 to i8*
  call void @free(i8* %60) #7
  br label %if.end97

if.else95:                                        ; preds = %if.end82
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call96 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.13, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end97:                                         ; preds = %if.end94
  %62 = load i8*, i8** %X_arg, align 8
  %63 = load i32, i32* %ipv4only, align 4
  %64 = load i32, i32* %ipv6only, align 4
  %call98 = call i32 @parse_addrs_list(i8* %62, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i64 0, i64 0), i32 %63, i32 %64, %struct.sockaddr** %local_addrs)
  store i32 %call98, i32* %number_local_addrs, align 4
  %65 = load i32, i32* %number_local_addrs, align 4
  %cmp99 = icmp sle i32 %65, 0
  br i1 %cmp99, label %if.then101, label %if.end103

if.then101:                                       ; preds = %if.end97
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call102 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %66, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.15, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end103:                                        ; preds = %if.end97
  %67 = load i32, i32* %number_servers, align 4
  %conv104 = sext i32 %67 to i64
  %call105 = call noalias i8* @calloc(i64 %conv104, i64 16) #7
  %68 = bitcast i8* %call105 to %struct.server_info*
  store %struct.server_info* %68, %struct.server_info** %server_infos, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end103
  %69 = load i32, i32* %i, align 4
  %70 = load i32, i32* %number_servers, align 4
  %cmp106 = icmp slt i32 %69, %70
  br i1 %cmp106, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %71 = load i8**, i8*** %S_args, align 8
  %72 = load i32, i32* %i, align 4
  %idxprom108 = sext i32 %72 to i64
  %arrayidx109 = getelementptr inbounds i8*, i8** %71, i64 %idxprom108
  %73 = load i8*, i8** %arrayidx109, align 8
  %74 = load i32, i32* %ipv4only, align 4
  %75 = load i32, i32* %ipv6only, align 4
  %76 = load %struct.server_info*, %struct.server_info** %server_infos, align 8
  %77 = load i32, i32* %i, align 4
  %idxprom110 = sext i32 %77 to i64
  %arrayidx111 = getelementptr inbounds %struct.server_info, %struct.server_info* %76, i64 %idxprom110
  %server_addrs = getelementptr inbounds %struct.server_info, %struct.server_info* %arrayidx111, i32 0, i32 0
  %call112 = call i32 @parse_addrs_list_port(i8* %73, i32 %74, i32 %75, %struct.sockaddr** %server_addrs)
  %78 = load %struct.server_info*, %struct.server_info** %server_infos, align 8
  %79 = load i32, i32* %i, align 4
  %idxprom113 = sext i32 %79 to i64
  %arrayidx114 = getelementptr inbounds %struct.server_info, %struct.server_info* %78, i64 %idxprom113
  %number_addrs = getelementptr inbounds %struct.server_info, %struct.server_info* %arrayidx114, i32 0, i32 1
  store i32 %call112, i32* %number_addrs, align 8
  %80 = load %struct.server_info*, %struct.server_info** %server_infos, align 8
  %81 = load i32, i32* %i, align 4
  %idxprom115 = sext i32 %81 to i64
  %arrayidx116 = getelementptr inbounds %struct.server_info, %struct.server_info* %80, i64 %idxprom115
  %number_addrs117 = getelementptr inbounds %struct.server_info, %struct.server_info* %arrayidx116, i32 0, i32 1
  %82 = load i32, i32* %number_addrs117, align 8
  %cmp118 = icmp sle i32 %82, 0
  br i1 %cmp118, label %if.then120, label %if.end122

if.then120:                                       ; preds = %for.body
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %84 = load i32, i32* %i, align 4
  %call121 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %83, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.16, i64 0, i64 0), i32 %84)
  store i32 1, i32* %retval, align 4
  br label %return

if.end122:                                        ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end122
  %85 = load i32, i32* %i, align 4
  %inc123 = add nsw i32 %85, 1
  store i32 %inc123, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %86 = load i32, i32* %fd, align 4
  %call124 = call i32 @listen(i32 %86, i32 10) #7
  %cmp125 = icmp slt i32 %call124, 0
  br i1 %cmp125, label %if.then127, label %if.end131

if.then127:                                       ; preds = %for.end
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call128 = call i32* @__errno_location() #8
  %88 = load i32, i32* %call128, align 4
  %call129 = call i8* @strerror(i32 %88) #7
  %call130 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %87, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.17, i64 0, i64 0), i8* %call129)
  store i32 1, i32* %retval, align 4
  br label %return

if.end131:                                        ; preds = %for.end
  br label %for.cond132

for.cond132:                                      ; preds = %if.end158, %if.end131
  %call133 = call noalias i8* @calloc(i64 1, i64 96) #7
  %89 = bitcast i8* %call133 to %struct.proxy_info*
  store %struct.proxy_info* %89, %struct.proxy_info** %proxy_info, align 8
  %90 = load i32, i32* %fd, align 4
  %call134 = call i32 @accept(i32 %90, %struct.sockaddr* null, i32* null)
  %91 = load %struct.proxy_info*, %struct.proxy_info** %proxy_info, align 8
  %client_fd = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %91, i32 0, i32 2
  store i32 %call134, i32* %client_fd, align 8
  %cmp135 = icmp slt i32 %call134, 0
  br i1 %cmp135, label %if.then137, label %if.else141

if.then137:                                       ; preds = %for.cond132
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call138 = call i32* @__errno_location() #8
  %93 = load i32, i32* %call138, align 4
  %call139 = call i8* @strerror(i32 %93) #7
  %call140 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %92, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.18, i64 0, i64 0), i8* %call139)
  %94 = load %struct.proxy_info*, %struct.proxy_info** %proxy_info, align 8
  %95 = bitcast %struct.proxy_info* %94 to i8*
  call void @free(i8* %95) #7
  br label %if.end158

if.else141:                                       ; preds = %for.cond132
  %96 = load %struct.server_info*, %struct.server_info** %server_infos, align 8
  %97 = load i32, i32* %number_servers, align 4
  %call142 = call %struct.server_info* @select_a_server(%struct.server_info* %96, i32 %97)
  store %struct.server_info* %call142, %struct.server_info** %server_info, align 8
  %98 = load i32, i32* %ipv4only, align 4
  %99 = load %struct.proxy_info*, %struct.proxy_info** %proxy_info, align 8
  %ipv4only143 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %99, i32 0, i32 0
  store i32 %98, i32* %ipv4only143, align 8
  %100 = load i32, i32* %ipv6only, align 4
  %101 = load %struct.proxy_info*, %struct.proxy_info** %proxy_info, align 8
  %ipv6only144 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %101, i32 0, i32 1
  store i32 %100, i32* %ipv6only144, align 4
  %102 = load %struct.proxy_info*, %struct.proxy_info** %proxy_info, align 8
  %server_fd = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %102, i32 0, i32 3
  store i32 -1, i32* %server_fd, align 4
  %103 = load %struct.sockaddr*, %struct.sockaddr** %local_addrs, align 8
  %104 = load %struct.proxy_info*, %struct.proxy_info** %proxy_info, align 8
  %local_addrs145 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %104, i32 0, i32 4
  store %struct.sockaddr* %103, %struct.sockaddr** %local_addrs145, align 8
  %105 = load i32, i32* %number_local_addrs, align 4
  %106 = load %struct.proxy_info*, %struct.proxy_info** %proxy_info, align 8
  %number_local_addrs146 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %106, i32 0, i32 5
  store i32 %105, i32* %number_local_addrs146, align 8
  %107 = load %struct.server_info*, %struct.server_info** %server_info, align 8
  %server_addrs147 = getelementptr inbounds %struct.server_info, %struct.server_info* %107, i32 0, i32 0
  %108 = load %struct.sockaddr*, %struct.sockaddr** %server_addrs147, align 8
  %109 = load %struct.proxy_info*, %struct.proxy_info** %proxy_info, align 8
  %server_addrs148 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %109, i32 0, i32 6
  store %struct.sockaddr* %108, %struct.sockaddr** %server_addrs148, align 8
  %110 = load %struct.server_info*, %struct.server_info** %server_info, align 8
  %number_addrs149 = getelementptr inbounds %struct.server_info, %struct.server_info* %110, i32 0, i32 1
  %111 = load i32, i32* %number_addrs149, align 8
  %112 = load %struct.proxy_info*, %struct.proxy_info** %proxy_info, align 8
  %number_server_addrs = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %112, i32 0, i32 7
  store i32 %111, i32* %number_server_addrs, align 8
  %113 = load %struct.proxy_info*, %struct.proxy_info** %proxy_info, align 8
  %114 = bitcast %struct.proxy_info* %113 to i8*
  %call150 = call i32 @pthread_create(i64* %tid, %union.pthread_attr_t* null, i8* (i8*)* @proxy, i8* %114) #7
  %cmp151 = icmp ne i32 %call150, 0
  br i1 %cmp151, label %if.then153, label %if.end157

if.then153:                                       ; preds = %if.else141
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call154 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %115, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.19, i64 0, i64 0))
  %116 = load %struct.proxy_info*, %struct.proxy_info** %proxy_info, align 8
  %client_fd155 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %116, i32 0, i32 2
  %117 = load i32, i32* %client_fd155, align 8
  %call156 = call i32 @close(i32 %117)
  %118 = load %struct.proxy_info*, %struct.proxy_info** %proxy_info, align 8
  %119 = bitcast %struct.proxy_info* %118 to i8*
  call void @free(i8* %119) #7
  br label %if.end157

if.end157:                                        ; preds = %if.then153, %if.else141
  br label %if.end158

if.end158:                                        ; preds = %if.end157, %if.then137
  br label %for.cond132

return:                                           ; preds = %if.then127, %if.then120, %if.then101, %if.else95, %if.then90, %if.then78, %if.then70, %if.then51, %sw.default, %if.then43, %if.then38, %if.then33, %if.else26, %if.then13, %if.else
  %120 = load i32, i32* %retval, align 4
  ret i32 %120
}

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind
declare dso_local i32 @getopt(i32, i8**, i8*) #1

; Function Attrs: nounwind
declare dso_local i64 @strtol(i8*, i8**, i32) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #1

; Function Attrs: nounwind
declare dso_local i8* @strerror(i32) #1

; Function Attrs: nounwind readnone
declare dso_local i32* @__errno_location() #3

; Function Attrs: nounwind
declare dso_local i32 @setsockopt(i32, i32, i32, i8*, i32) #1

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @parse_addrs_list_port(i8* %addr_list, i32 %ipv4only, i32 %ipv6only, %struct.sockaddr** %addrs) #0 {
entry:
  %retval = alloca i32, align 4
  %addr_list.addr = alloca i8*, align 8
  %ipv4only.addr = alloca i32, align 4
  %ipv6only.addr = alloca i32, align 4
  %addrs.addr = alloca %struct.sockaddr**, align 8
  %port = alloca i8*, align 8
  %last_colon = alloca i8*, align 8
  store i8* %addr_list, i8** %addr_list.addr, align 8
  store i32 %ipv4only, i32* %ipv4only.addr, align 4
  store i32 %ipv6only, i32* %ipv6only.addr, align 4
  store %struct.sockaddr** %addrs, %struct.sockaddr*** %addrs.addr, align 8
  %0 = load i8*, i8** %addr_list.addr, align 8
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %addr_list.addr, align 8
  %call = call i8* @strrchr(i8* %1, i32 58) #9
  store i8* %call, i8** %last_colon, align 8
  %2 = load i8*, i8** %last_colon, align 8
  %cmp1 = icmp eq i8* %2, null
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end
  %3 = load i8*, i8** %last_colon, align 8
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 1
  store i8* %add.ptr, i8** %port, align 8
  %4 = load i8*, i8** %last_colon, align 8
  store i8 0, i8* %4, align 1
  %5 = load i8*, i8** %addr_list.addr, align 8
  %6 = load i8*, i8** %port, align 8
  %7 = load i32, i32* %ipv4only.addr, align 4
  %8 = load i32, i32* %ipv6only.addr, align 4
  %9 = load %struct.sockaddr**, %struct.sockaddr*** %addrs.addr, align 8
  %call3 = call i32 @parse_addrs_list(i8* %5, i8* %6, i32 %7, i32 %8, %struct.sockaddr** %9)
  store i32 %call3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then2, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

declare dso_local i32 @sctp_bindx(i32, %struct.sockaddr*, i32, i32) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @parse_addrs_list(i8* %addr_list, i8* %port, i32 %ipv4only, i32 %ipv6only, %struct.sockaddr** %addrs) #0 {
entry:
  %retval = alloca i32, align 4
  %addr_list.addr = alloca i8*, align 8
  %port.addr = alloca i8*, align 8
  %ipv4only.addr = alloca i32, align 4
  %ipv6only.addr = alloca i32, align 4
  %addrs.addr = alloca %struct.sockaddr**, align 8
  %hints = alloca %struct.addrinfo, align 8
  %res = alloca %struct.addrinfo*, align 8
  %addr = alloca i8*, align 8
  %tmp = alloca i8*, align 8
  %size = alloca i64, align 8
  %number_local_addrs = alloca i32, align 4
  store i8* %addr_list, i8** %addr_list.addr, align 8
  store i8* %port, i8** %port.addr, align 8
  store i32 %ipv4only, i32* %ipv4only.addr, align 4
  store i32 %ipv6only, i32* %ipv6only.addr, align 4
  store %struct.sockaddr** %addrs, %struct.sockaddr*** %addrs.addr, align 8
  %0 = load i8*, i8** %addr_list.addr, align 8
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %port.addr, align 8
  %cmp1 = icmp eq i8* %1, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 1, i32* %number_local_addrs, align 4
  %2 = load i8*, i8** %addr_list.addr, align 8
  store i8* %2, i8** %tmp, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i8*, i8** %tmp, align 8
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %cmp2 = icmp ne i32 %conv, 0
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %tmp, align 8
  %6 = load i8, i8* %5, align 1
  %conv4 = sext i8 %6 to i32
  %cmp5 = icmp eq i32 %conv4, 44
  br i1 %cmp5, label %if.then7, label %if.end8

if.then7:                                         ; preds = %for.body
  %7 = load i32, i32* %number_local_addrs, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %number_local_addrs, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end8
  %8 = load i8*, i8** %tmp, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr, i8** %tmp, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %ipv4only.addr, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %if.then9, label %if.else

if.then9:                                         ; preds = %for.end
  %10 = load i32, i32* %number_local_addrs, align 4
  %conv10 = sext i32 %10 to i64
  %mul = mul i64 %conv10, 16
  store i64 %mul, i64* %size, align 8
  br label %if.end13

if.else:                                          ; preds = %for.end
  %11 = load i32, i32* %number_local_addrs, align 4
  %conv11 = sext i32 %11 to i64
  %mul12 = mul i64 %conv11, 28
  store i64 %mul12, i64* %size, align 8
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then9
  %12 = load i64, i64* %size, align 8
  %call = call noalias i8* @malloc(i64 %12) #7
  %13 = bitcast i8* %call to %struct.sockaddr*
  %14 = load %struct.sockaddr**, %struct.sockaddr*** %addrs.addr, align 8
  store %struct.sockaddr* %13, %struct.sockaddr** %14, align 8
  %15 = bitcast %struct.addrinfo* %hints to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %15, i8 0, i64 48, i1 false)
  %16 = load i32, i32* %ipv4only.addr, align 4
  %tobool14 = icmp ne i32 %16, 0
  br i1 %tobool14, label %if.then15, label %if.else16

if.then15:                                        ; preds = %if.end13
  %ai_family = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %hints, i32 0, i32 1
  store i32 2, i32* %ai_family, align 4
  br label %if.end18

if.else16:                                        ; preds = %if.end13
  %ai_family17 = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %hints, i32 0, i32 1
  store i32 10, i32* %ai_family17, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.else16, %if.then15
  %ai_socktype = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %hints, i32 0, i32 2
  store i32 1, i32* %ai_socktype, align 8
  %ai_protocol = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %hints, i32 0, i32 3
  store i32 132, i32* %ai_protocol, align 4
  %ai_flags = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %hints, i32 0, i32 0
  store i32 1028, i32* %ai_flags, align 8
  %17 = load i32, i32* %ipv4only.addr, align 4
  %tobool19 = icmp ne i32 %17, 0
  br i1 %tobool19, label %if.end23, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end18
  %18 = load i32, i32* %ipv6only.addr, align 4
  %tobool20 = icmp ne i32 %18, 0
  br i1 %tobool20, label %if.end23, label %if.then21

if.then21:                                        ; preds = %land.lhs.true
  %ai_flags22 = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %hints, i32 0, i32 0
  %19 = load i32, i32* %ai_flags22, align 8
  %or = or i32 %19, 8
  store i32 %or, i32* %ai_flags22, align 8
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %land.lhs.true, %if.end18
  %20 = load %struct.sockaddr**, %struct.sockaddr*** %addrs.addr, align 8
  %21 = load %struct.sockaddr*, %struct.sockaddr** %20, align 8
  %22 = bitcast %struct.sockaddr* %21 to i8*
  store i8* %22, i8** %tmp, align 8
  %23 = load i8*, i8** %addr_list.addr, align 8
  %call24 = call i8* @strtok(i8* %23, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20, i64 0, i64 0)) #7
  store i8* %call24, i8** %addr, align 8
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc36, %if.end23
  %24 = load i8*, i8** %addr, align 8
  %cmp26 = icmp ne i8* %24, null
  br i1 %cmp26, label %for.body28, label %for.end38

for.body28:                                       ; preds = %for.cond25
  %25 = load i8*, i8** %addr, align 8
  %26 = load i8*, i8** %port.addr, align 8
  %call29 = call i32 @getaddrinfo(i8* %25, i8* %26, %struct.addrinfo* %hints, %struct.addrinfo** %res)
  %cmp30 = icmp ne i32 %call29, 0
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %for.body28
  store i32 -1, i32* %retval, align 4
  br label %return

if.end33:                                         ; preds = %for.body28
  %27 = load i8*, i8** %tmp, align 8
  %28 = load %struct.addrinfo*, %struct.addrinfo** %res, align 8
  %ai_addr = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %28, i32 0, i32 5
  %29 = load %struct.sockaddr*, %struct.sockaddr** %ai_addr, align 8
  %30 = bitcast %struct.sockaddr* %29 to i8*
  %31 = load %struct.addrinfo*, %struct.addrinfo** %res, align 8
  %ai_addrlen = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %31, i32 0, i32 4
  %32 = load i32, i32* %ai_addrlen, align 8
  %conv34 = zext i32 %32 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %27, i8* align 2 %30, i64 %conv34, i1 false)
  %33 = load %struct.addrinfo*, %struct.addrinfo** %res, align 8
  %ai_addrlen35 = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %33, i32 0, i32 4
  %34 = load i32, i32* %ai_addrlen35, align 8
  %35 = load i8*, i8** %tmp, align 8
  %idx.ext = zext i32 %34 to i64
  %add.ptr = getelementptr inbounds i8, i8* %35, i64 %idx.ext
  store i8* %add.ptr, i8** %tmp, align 8
  %36 = load %struct.addrinfo*, %struct.addrinfo** %res, align 8
  call void @freeaddrinfo(%struct.addrinfo* %36) #7
  br label %for.inc36

for.inc36:                                        ; preds = %if.end33
  %call37 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20, i64 0, i64 0)) #7
  store i8* %call37, i8** %addr, align 8
  br label %for.cond25

for.end38:                                        ; preds = %for.cond25
  %37 = load i32, i32* %number_local_addrs, align 4
  store i32 %37, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end38, %if.then32, %if.then
  %38 = load i32, i32* %retval, align 4
  ret i32 %38
}

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #1

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct.server_info* @select_a_server(%struct.server_info* %server_infos, i32 %number_servers) #0 {
entry:
  %server_infos.addr = alloca %struct.server_info*, align 8
  %number_servers.addr = alloca i32, align 4
  store %struct.server_info* %server_infos, %struct.server_info** %server_infos.addr, align 8
  store i32 %number_servers, i32* %number_servers.addr, align 4
  %0 = load i32, i32* @select_a_server.i, align 4
  %1 = load i32, i32* %number_servers.addr, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* @select_a_server.i, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct.server_info*, %struct.server_info** %server_infos.addr, align 8
  %3 = load i32, i32* @select_a_server.i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* @select_a_server.i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds %struct.server_info, %struct.server_info* %2, i64 %idxprom
  ret %struct.server_info* %arrayidx
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @proxy(i8* %arg) #0 {
entry:
  %arg.addr = alloca i8*, align 8
  %info = alloca %struct.proxy_info*, align 8
  %rset = alloca %struct.fd_set, align 8
  %max_fd = alloca i32, align 4
  %flags = alloca i32, align 4
  %n = alloca i64, align 8
  %sndrcvinfo = alloca %struct.sctp_sndrcvinfo, align 4
  %status = alloca %struct.sctp_status, align 4
  %initmsg = alloca %struct.sctp_initmsg, align 2
  %events = alloca %struct.sctp_event_subscribe, align 1
  %len = alloca i32, align 4
  %__d0 = alloca i32, align 4
  %__d1 = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  %call = call i64 @pthread_self() #8
  %call1 = call i32 @pthread_detach(i64 %call) #7
  %0 = load i8*, i8** %arg.addr, align 8
  %1 = bitcast i8* %0 to %struct.proxy_info*
  store %struct.proxy_info* %1, %struct.proxy_info** %info, align 8
  store i32 176, i32* %len, align 4
  %2 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_fd = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %2, i32 0, i32 2
  %3 = load i32, i32* %client_fd, align 8
  %4 = bitcast %struct.sctp_status* %status to i8*
  %call2 = call i32 @getsockopt(i32 %3, i32 132, i32 14, i8* %4, i32* %len) #7
  %cmp = icmp slt i32 %call2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call3 = call i32* @__errno_location() #8
  %6 = load i32, i32* %call3, align 4
  %call4 = call i8* @strerror(i32 %6) #7
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.21, i64 0, i64 0), i8* %call4)
  br label %cleanup

if.end:                                           ; preds = %entry
  %7 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf_size = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %7, i32 0, i32 9
  store i64 10240, i64* %client_buf_size, align 8
  %8 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf_offset = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %8, i32 0, i32 10
  store i64 0, i64* %client_buf_offset, align 8
  %9 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf_size6 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %9, i32 0, i32 9
  %10 = load i64, i64* %client_buf_size6, align 8
  %call7 = call noalias i8* @malloc(i64 %10) #7
  %11 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %11, i32 0, i32 8
  store i8* %call7, i8** %client_buf, align 8
  %12 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf8 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %12, i32 0, i32 8
  %13 = load i8*, i8** %client_buf8, align 8
  %cmp9 = icmp eq i8* %13, null
  br i1 %cmp9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %if.end
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.22, i64 0, i64 0))
  br label %cleanup

if.end12:                                         ; preds = %if.end
  %15 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf_size = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %15, i32 0, i32 12
  store i64 10240, i64* %server_buf_size, align 8
  %16 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf_offset = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %16, i32 0, i32 13
  store i64 0, i64* %server_buf_offset, align 8
  %17 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf_size13 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %17, i32 0, i32 12
  %18 = load i64, i64* %server_buf_size13, align 8
  %call14 = call noalias i8* @malloc(i64 %18) #7
  %19 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %19, i32 0, i32 11
  store i8* %call14, i8** %server_buf, align 8
  %20 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf15 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %20, i32 0, i32 11
  %21 = load i8*, i8** %server_buf15, align 8
  %cmp16 = icmp eq i8* %21, null
  br i1 %cmp16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %if.end12
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.23, i64 0, i64 0))
  br label %cleanup

if.end19:                                         ; preds = %if.end12
  %23 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %ipv4only = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %23, i32 0, i32 0
  %24 = load i32, i32* %ipv4only, align 8
  %tobool = icmp ne i32 %24, 0
  %25 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i32 2, i32 10
  %call20 = call i32 @socket(i32 %cond, i32 1, i32 132) #7
  %26 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %26, i32 0, i32 3
  store i32 %call20, i32* %server_fd, align 4
  %cmp21 = icmp slt i32 %call20, 0
  br i1 %cmp21, label %if.then22, label %if.end26

if.then22:                                        ; preds = %if.end19
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call23 = call i32* @__errno_location() #8
  %28 = load i32, i32* %call23, align 4
  %call24 = call i8* @strerror(i32 %28) #7
  %call25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.24, i64 0, i64 0), i8* %call24)
  br label %cleanup

if.end26:                                         ; preds = %if.end19
  %29 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %ipv4only27 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %29, i32 0, i32 0
  %30 = load i32, i32* %ipv4only27, align 8
  %tobool28 = icmp ne i32 %30, 0
  br i1 %tobool28, label %if.end38, label %if.then29

if.then29:                                        ; preds = %if.end26
  %31 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd30 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %31, i32 0, i32 3
  %32 = load i32, i32* %server_fd30, align 4
  %33 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %ipv6only = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %33, i32 0, i32 1
  %34 = bitcast i32* %ipv6only to i8*
  %call31 = call i32 @setsockopt(i32 %32, i32 41, i32 26, i8* %34, i32 4) #7
  %cmp32 = icmp slt i32 %call31, 0
  br i1 %cmp32, label %if.then33, label %if.end37

if.then33:                                        ; preds = %if.then29
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call34 = call i32* @__errno_location() #8
  %36 = load i32, i32* %call34, align 4
  %call35 = call i8* @strerror(i32 %36) #7
  %call36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.25, i64 0, i64 0), i8* %call35)
  br label %cleanup

if.end37:                                         ; preds = %if.then29
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.end26
  %37 = bitcast %struct.sctp_initmsg* %initmsg to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %37, i8 0, i64 8, i1 false)
  %sstat_instrms = getelementptr inbounds %struct.sctp_status, %struct.sctp_status* %status, i32 0, i32 5
  %38 = load i16, i16* %sstat_instrms, align 4
  %sinit_num_ostreams = getelementptr inbounds %struct.sctp_initmsg, %struct.sctp_initmsg* %initmsg, i32 0, i32 0
  store i16 %38, i16* %sinit_num_ostreams, align 2
  %sstat_outstrms = getelementptr inbounds %struct.sctp_status, %struct.sctp_status* %status, i32 0, i32 6
  %39 = load i16, i16* %sstat_outstrms, align 2
  %sinit_max_instreams = getelementptr inbounds %struct.sctp_initmsg, %struct.sctp_initmsg* %initmsg, i32 0, i32 1
  store i16 %39, i16* %sinit_max_instreams, align 2
  %40 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd39 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %40, i32 0, i32 3
  %41 = load i32, i32* %server_fd39, align 4
  %42 = bitcast %struct.sctp_initmsg* %initmsg to i8*
  %call40 = call i32 @setsockopt(i32 %41, i32 132, i32 2, i8* %42, i32 8) #7
  %cmp41 = icmp slt i32 %call40, 0
  br i1 %cmp41, label %if.then42, label %if.end46

if.then42:                                        ; preds = %if.end38
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call43 = call i32* @__errno_location() #8
  %44 = load i32, i32* %call43, align 4
  %call44 = call i8* @strerror(i32 %44) #7
  %call45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.26, i64 0, i64 0), i8* %call44)
  br label %cleanup

if.end46:                                         ; preds = %if.end38
  %45 = bitcast %struct.sctp_event_subscribe* %events to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %45, i8 0, i64 13, i1 false)
  %sctp_data_io_event = getelementptr inbounds %struct.sctp_event_subscribe, %struct.sctp_event_subscribe* %events, i32 0, i32 0
  store i8 1, i8* %sctp_data_io_event, align 1
  %46 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd47 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %46, i32 0, i32 3
  %47 = load i32, i32* %server_fd47, align 4
  %48 = bitcast %struct.sctp_event_subscribe* %events to i8*
  %call48 = call i32 @setsockopt(i32 %47, i32 132, i32 11, i8* %48, i32 13) #7
  %cmp49 = icmp slt i32 %call48, 0
  br i1 %cmp49, label %if.then50, label %if.end54

if.then50:                                        ; preds = %if.end46
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call51 = call i32* @__errno_location() #8
  %50 = load i32, i32* %call51, align 4
  %call52 = call i8* @strerror(i32 %50) #7
  %call53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.11, i64 0, i64 0), i8* %call52)
  br label %cleanup

if.end54:                                         ; preds = %if.end46
  %51 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd55 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %51, i32 0, i32 3
  %52 = load i32, i32* %server_fd55, align 4
  %53 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %local_addrs = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %53, i32 0, i32 4
  %54 = load %struct.sockaddr*, %struct.sockaddr** %local_addrs, align 8
  %55 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %number_local_addrs = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %55, i32 0, i32 5
  %56 = load i32, i32* %number_local_addrs, align 8
  %call56 = call i32 @sctp_bindx(i32 %52, %struct.sockaddr* %54, i32 %56, i32 1)
  %cmp57 = icmp slt i32 %call56, 0
  br i1 %cmp57, label %if.then58, label %if.end62

if.then58:                                        ; preds = %if.end54
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call59 = call i32* @__errno_location() #8
  %58 = load i32, i32* %call59, align 4
  %call60 = call i8* @strerror(i32 %58) #7
  %call61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.27, i64 0, i64 0), i8* %call60)
  br label %cleanup

if.end62:                                         ; preds = %if.end54
  %59 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd63 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %59, i32 0, i32 3
  %60 = load i32, i32* %server_fd63, align 4
  %61 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_addrs = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %61, i32 0, i32 6
  %62 = load %struct.sockaddr*, %struct.sockaddr** %server_addrs, align 8
  %63 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %number_server_addrs = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %63, i32 0, i32 7
  %64 = load i32, i32* %number_server_addrs, align 8
  %call64 = call i32 @sctp_connectx(i32 %60, %struct.sockaddr* %62, i32 %64, i32* null)
  %cmp65 = icmp slt i32 %call64, 0
  br i1 %cmp65, label %if.then66, label %if.end70

if.then66:                                        ; preds = %if.end62
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call67 = call i32* @__errno_location() #8
  %66 = load i32, i32* %call67, align 4
  %call68 = call i8* @strerror(i32 %66) #7
  %call69 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %65, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.28, i64 0, i64 0), i8* %call68)
  br label %cleanup

if.end70:                                         ; preds = %if.end62
  br label %for.cond

for.cond:                                         ; preds = %if.end246, %if.end70
  br label %do.body

do.body:                                          ; preds = %for.cond
  %__fds_bits = getelementptr inbounds %struct.fd_set, %struct.fd_set* %rset, i32 0, i32 0
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* %__fds_bits, i64 0, i64 0
  %67 = call { i64, i64* } asm sideeffect "cld; rep; stosq", "={cx},={di},{ax},0,1,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 0, i64 16, i64* %arrayidx) #7, !srcloc !2
  %asmresult = extractvalue { i64, i64* } %67, 0
  %asmresult71 = extractvalue { i64, i64* } %67, 1
  %68 = trunc i64 %asmresult to i32
  store i32 %68, i32* %__d0, align 4
  %69 = ptrtoint i64* %asmresult71 to i64
  %70 = trunc i64 %69 to i32
  store i32 %70, i32* %__d1, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  store i32 -1, i32* %max_fd, align 4
  %71 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_fd72 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %71, i32 0, i32 2
  %72 = load i32, i32* %client_fd72, align 8
  %rem = srem i32 %72, 64
  %sh_prom = zext i32 %rem to i64
  %shl = shl i64 1, %sh_prom
  %__fds_bits73 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %rset, i32 0, i32 0
  %73 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_fd74 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %73, i32 0, i32 2
  %74 = load i32, i32* %client_fd74, align 8
  %div = sdiv i32 %74, 64
  %idxprom = sext i32 %div to i64
  %arrayidx75 = getelementptr inbounds [16 x i64], [16 x i64]* %__fds_bits73, i64 0, i64 %idxprom
  %75 = load i64, i64* %arrayidx75, align 8
  %or = or i64 %75, %shl
  store i64 %or, i64* %arrayidx75, align 8
  %76 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_fd76 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %76, i32 0, i32 2
  %77 = load i32, i32* %client_fd76, align 8
  %78 = load i32, i32* %max_fd, align 4
  %cmp77 = icmp sgt i32 %77, %78
  br i1 %cmp77, label %if.then78, label %if.end80

if.then78:                                        ; preds = %do.end
  %79 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_fd79 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %79, i32 0, i32 2
  %80 = load i32, i32* %client_fd79, align 8
  store i32 %80, i32* %max_fd, align 4
  br label %if.end80

if.end80:                                         ; preds = %if.then78, %do.end
  %81 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd81 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %81, i32 0, i32 3
  %82 = load i32, i32* %server_fd81, align 4
  %rem82 = srem i32 %82, 64
  %sh_prom83 = zext i32 %rem82 to i64
  %shl84 = shl i64 1, %sh_prom83
  %__fds_bits85 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %rset, i32 0, i32 0
  %83 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd86 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %83, i32 0, i32 3
  %84 = load i32, i32* %server_fd86, align 4
  %div87 = sdiv i32 %84, 64
  %idxprom88 = sext i32 %div87 to i64
  %arrayidx89 = getelementptr inbounds [16 x i64], [16 x i64]* %__fds_bits85, i64 0, i64 %idxprom88
  %85 = load i64, i64* %arrayidx89, align 8
  %or90 = or i64 %85, %shl84
  store i64 %or90, i64* %arrayidx89, align 8
  %86 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd91 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %86, i32 0, i32 3
  %87 = load i32, i32* %server_fd91, align 4
  %88 = load i32, i32* %max_fd, align 4
  %cmp92 = icmp sgt i32 %87, %88
  br i1 %cmp92, label %if.then93, label %if.end95

if.then93:                                        ; preds = %if.end80
  %89 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd94 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %89, i32 0, i32 3
  %90 = load i32, i32* %server_fd94, align 4
  store i32 %90, i32* %max_fd, align 4
  br label %if.end95

if.end95:                                         ; preds = %if.then93, %if.end80
  %91 = load i32, i32* %max_fd, align 4
  %add = add nsw i32 %91, 1
  %call96 = call i32 @select(i32 %add, %struct.fd_set* %rset, %struct.fd_set* null, %struct.fd_set* null, %struct.timeval* null)
  %__fds_bits97 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %rset, i32 0, i32 0
  %92 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_fd98 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %92, i32 0, i32 2
  %93 = load i32, i32* %client_fd98, align 8
  %div99 = sdiv i32 %93, 64
  %idxprom100 = sext i32 %div99 to i64
  %arrayidx101 = getelementptr inbounds [16 x i64], [16 x i64]* %__fds_bits97, i64 0, i64 %idxprom100
  %94 = load i64, i64* %arrayidx101, align 8
  %95 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_fd102 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %95, i32 0, i32 2
  %96 = load i32, i32* %client_fd102, align 8
  %rem103 = srem i32 %96, 64
  %sh_prom104 = zext i32 %rem103 to i64
  %shl105 = shl i64 1, %sh_prom104
  %and = and i64 %94, %shl105
  %cmp106 = icmp ne i64 %and, 0
  br i1 %cmp106, label %if.then107, label %if.end166

if.then107:                                       ; preds = %if.end95
  store i32 0, i32* %flags, align 4
  %97 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_fd108 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %97, i32 0, i32 2
  %98 = load i32, i32* %client_fd108, align 8
  %99 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf109 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %99, i32 0, i32 8
  %100 = load i8*, i8** %client_buf109, align 8
  %101 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf_offset110 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %101, i32 0, i32 10
  %102 = load i64, i64* %client_buf_offset110, align 8
  %add.ptr = getelementptr inbounds i8, i8* %100, i64 %102
  %103 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf_size111 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %103, i32 0, i32 9
  %104 = load i64, i64* %client_buf_size111, align 8
  %105 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf_offset112 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %105, i32 0, i32 10
  %106 = load i64, i64* %client_buf_offset112, align 8
  %sub = sub i64 %104, %106
  %call113 = call i32 @sctp_recvmsg(i32 %98, i8* %add.ptr, i64 %sub, %struct.sockaddr* null, i32* null, %struct.sctp_sndrcvinfo* %sndrcvinfo, i32* %flags)
  %conv = sext i32 %call113 to i64
  store i64 %conv, i64* %n, align 8
  %107 = load i64, i64* %n, align 8
  %cmp114 = icmp slt i64 %107, 0
  br i1 %cmp114, label %if.then116, label %if.else

if.then116:                                       ; preds = %if.then107
  %108 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call117 = call i32* @__errno_location() #8
  %109 = load i32, i32* %call117, align 4
  %call118 = call i8* @strerror(i32 %109) #7
  %call119 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %108, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.29, i64 0, i64 0), i8* %call118)
  br label %cleanup

if.else:                                          ; preds = %if.then107
  %110 = load i64, i64* %n, align 8
  %cmp120 = icmp eq i64 %110, 0
  br i1 %cmp120, label %if.then122, label %if.else123

if.then122:                                       ; preds = %if.else
  br label %cleanup

if.else123:                                       ; preds = %if.else
  %111 = load i64, i64* %n, align 8
  %112 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf_offset124 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %112, i32 0, i32 10
  %113 = load i64, i64* %client_buf_offset124, align 8
  %add125 = add i64 %113, %111
  store i64 %add125, i64* %client_buf_offset124, align 8
  %114 = load i32, i32* %flags, align 4
  %and126 = and i32 %114, 128
  %tobool127 = icmp ne i32 %and126, 0
  br i1 %tobool127, label %if.then128, label %if.else145

if.then128:                                       ; preds = %if.else123
  %115 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd129 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %115, i32 0, i32 3
  %116 = load i32, i32* %server_fd129, align 4
  %117 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf130 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %117, i32 0, i32 8
  %118 = load i8*, i8** %client_buf130, align 8
  %119 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf_offset131 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %119, i32 0, i32 10
  %120 = load i64, i64* %client_buf_offset131, align 8
  %sinfo_ppid = getelementptr inbounds %struct.sctp_sndrcvinfo, %struct.sctp_sndrcvinfo* %sndrcvinfo, i32 0, i32 3
  %121 = load i32, i32* %sinfo_ppid, align 4
  %sinfo_flags = getelementptr inbounds %struct.sctp_sndrcvinfo, %struct.sctp_sndrcvinfo* %sndrcvinfo, i32 0, i32 2
  %122 = load i16, i16* %sinfo_flags, align 4
  %conv132 = zext i16 %122 to i32
  %and133 = and i32 %conv132, 1
  %sinfo_stream = getelementptr inbounds %struct.sctp_sndrcvinfo, %struct.sctp_sndrcvinfo* %sndrcvinfo, i32 0, i32 0
  %123 = load i16, i16* %sinfo_stream, align 4
  %call134 = call i32 @sctp_sendmsg(i32 %116, i8* %118, i64 %120, %struct.sockaddr* null, i32 0, i32 %121, i32 %and133, i16 zeroext %123, i32 0, i32 0)
  %conv135 = sext i32 %call134 to i64
  store i64 %conv135, i64* %n, align 8
  %124 = load i64, i64* %n, align 8
  %cmp136 = icmp slt i64 %124, 0
  br i1 %cmp136, label %if.then138, label %if.else142

if.then138:                                       ; preds = %if.then128
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call139 = call i32* @__errno_location() #8
  %126 = load i32, i32* %call139, align 4
  %call140 = call i8* @strerror(i32 %126) #7
  %call141 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %125, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.30, i64 0, i64 0), i8* %call140)
  br label %cleanup

if.else142:                                       ; preds = %if.then128
  %127 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf_offset143 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %127, i32 0, i32 10
  store i64 0, i64* %client_buf_offset143, align 8
  br label %if.end144

if.end144:                                        ; preds = %if.else142
  br label %if.end163

if.else145:                                       ; preds = %if.else123
  %128 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf_offset146 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %128, i32 0, i32 10
  %129 = load i64, i64* %client_buf_offset146, align 8
  %130 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf_size147 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %130, i32 0, i32 9
  %131 = load i64, i64* %client_buf_size147, align 8
  %cmp148 = icmp eq i64 %129, %131
  br i1 %cmp148, label %if.then150, label %if.end162

if.then150:                                       ; preds = %if.else145
  %132 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf_size151 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %132, i32 0, i32 9
  %133 = load i64, i64* %client_buf_size151, align 8
  %mul = mul i64 %133, 2
  store i64 %mul, i64* %client_buf_size151, align 8
  %134 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf152 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %134, i32 0, i32 8
  %135 = load i8*, i8** %client_buf152, align 8
  %136 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf_size153 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %136, i32 0, i32 9
  %137 = load i64, i64* %client_buf_size153, align 8
  %call154 = call i8* @realloc(i8* %135, i64 %137) #7
  %138 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf155 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %138, i32 0, i32 8
  store i8* %call154, i8** %client_buf155, align 8
  %139 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf156 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %139, i32 0, i32 8
  %140 = load i8*, i8** %client_buf156, align 8
  %cmp157 = icmp eq i8* %140, null
  br i1 %cmp157, label %if.then159, label %if.end161

if.then159:                                       ; preds = %if.then150
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call160 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %141, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.31, i64 0, i64 0))
  br label %cleanup

if.end161:                                        ; preds = %if.then150
  br label %if.end162

if.end162:                                        ; preds = %if.end161, %if.else145
  br label %if.end163

if.end163:                                        ; preds = %if.end162, %if.end144
  br label %if.end164

if.end164:                                        ; preds = %if.end163
  br label %if.end165

if.end165:                                        ; preds = %if.end164
  br label %if.end166

if.end166:                                        ; preds = %if.end165, %if.end95
  %__fds_bits167 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %rset, i32 0, i32 0
  %142 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd168 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %142, i32 0, i32 3
  %143 = load i32, i32* %server_fd168, align 4
  %div169 = sdiv i32 %143, 64
  %idxprom170 = sext i32 %div169 to i64
  %arrayidx171 = getelementptr inbounds [16 x i64], [16 x i64]* %__fds_bits167, i64 0, i64 %idxprom170
  %144 = load i64, i64* %arrayidx171, align 8
  %145 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd172 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %145, i32 0, i32 3
  %146 = load i32, i32* %server_fd172, align 4
  %rem173 = srem i32 %146, 64
  %sh_prom174 = zext i32 %rem173 to i64
  %shl175 = shl i64 1, %sh_prom174
  %and176 = and i64 %144, %shl175
  %cmp177 = icmp ne i64 %and176, 0
  br i1 %cmp177, label %if.then179, label %if.end246

if.then179:                                       ; preds = %if.end166
  store i32 0, i32* %flags, align 4
  %147 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd180 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %147, i32 0, i32 3
  %148 = load i32, i32* %server_fd180, align 4
  %149 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf181 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %149, i32 0, i32 11
  %150 = load i8*, i8** %server_buf181, align 8
  %151 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf_offset182 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %151, i32 0, i32 13
  %152 = load i64, i64* %server_buf_offset182, align 8
  %add.ptr183 = getelementptr inbounds i8, i8* %150, i64 %152
  %153 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf_size184 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %153, i32 0, i32 12
  %154 = load i64, i64* %server_buf_size184, align 8
  %155 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf_offset185 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %155, i32 0, i32 13
  %156 = load i64, i64* %server_buf_offset185, align 8
  %sub186 = sub i64 %154, %156
  %call187 = call i32 @sctp_recvmsg(i32 %148, i8* %add.ptr183, i64 %sub186, %struct.sockaddr* null, i32* null, %struct.sctp_sndrcvinfo* %sndrcvinfo, i32* %flags)
  %conv188 = sext i32 %call187 to i64
  store i64 %conv188, i64* %n, align 8
  %157 = load i64, i64* %n, align 8
  %cmp189 = icmp slt i64 %157, 0
  br i1 %cmp189, label %if.then191, label %if.else195

if.then191:                                       ; preds = %if.then179
  %158 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call192 = call i32* @__errno_location() #8
  %159 = load i32, i32* %call192, align 4
  %call193 = call i8* @strerror(i32 %159) #7
  %call194 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %158, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.29, i64 0, i64 0), i8* %call193)
  br label %cleanup

if.else195:                                       ; preds = %if.then179
  %160 = load i64, i64* %n, align 8
  %cmp196 = icmp eq i64 %160, 0
  br i1 %cmp196, label %if.then198, label %if.else199

if.then198:                                       ; preds = %if.else195
  br label %cleanup

if.else199:                                       ; preds = %if.else195
  %161 = load i64, i64* %n, align 8
  %162 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf_offset200 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %162, i32 0, i32 13
  %163 = load i64, i64* %server_buf_offset200, align 8
  %add201 = add i64 %163, %161
  store i64 %add201, i64* %server_buf_offset200, align 8
  %164 = load i32, i32* %flags, align 4
  %and202 = and i32 %164, 128
  %tobool203 = icmp ne i32 %and202, 0
  br i1 %tobool203, label %if.then204, label %if.else224

if.then204:                                       ; preds = %if.else199
  %165 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_fd205 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %165, i32 0, i32 2
  %166 = load i32, i32* %client_fd205, align 8
  %167 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf206 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %167, i32 0, i32 11
  %168 = load i8*, i8** %server_buf206, align 8
  %169 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf_offset207 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %169, i32 0, i32 13
  %170 = load i64, i64* %server_buf_offset207, align 8
  %sinfo_ppid208 = getelementptr inbounds %struct.sctp_sndrcvinfo, %struct.sctp_sndrcvinfo* %sndrcvinfo, i32 0, i32 3
  %171 = load i32, i32* %sinfo_ppid208, align 4
  %sinfo_flags209 = getelementptr inbounds %struct.sctp_sndrcvinfo, %struct.sctp_sndrcvinfo* %sndrcvinfo, i32 0, i32 2
  %172 = load i16, i16* %sinfo_flags209, align 4
  %conv210 = zext i16 %172 to i32
  %and211 = and i32 %conv210, 1
  %sinfo_stream212 = getelementptr inbounds %struct.sctp_sndrcvinfo, %struct.sctp_sndrcvinfo* %sndrcvinfo, i32 0, i32 0
  %173 = load i16, i16* %sinfo_stream212, align 4
  %call213 = call i32 @sctp_sendmsg(i32 %166, i8* %168, i64 %170, %struct.sockaddr* null, i32 0, i32 %171, i32 %and211, i16 zeroext %173, i32 0, i32 0)
  %conv214 = sext i32 %call213 to i64
  store i64 %conv214, i64* %n, align 8
  %174 = load i64, i64* %n, align 8
  %cmp215 = icmp slt i64 %174, 0
  br i1 %cmp215, label %if.then217, label %if.else221

if.then217:                                       ; preds = %if.then204
  %175 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call218 = call i32* @__errno_location() #8
  %176 = load i32, i32* %call218, align 4
  %call219 = call i8* @strerror(i32 %176) #7
  %call220 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %175, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.30, i64 0, i64 0), i8* %call219)
  br label %cleanup

if.else221:                                       ; preds = %if.then204
  %177 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf_offset222 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %177, i32 0, i32 13
  store i64 0, i64* %server_buf_offset222, align 8
  br label %if.end223

if.end223:                                        ; preds = %if.else221
  br label %if.end243

if.else224:                                       ; preds = %if.else199
  %178 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf_offset225 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %178, i32 0, i32 13
  %179 = load i64, i64* %server_buf_offset225, align 8
  %180 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf_size226 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %180, i32 0, i32 12
  %181 = load i64, i64* %server_buf_size226, align 8
  %cmp227 = icmp eq i64 %179, %181
  br i1 %cmp227, label %if.then229, label %if.end242

if.then229:                                       ; preds = %if.else224
  %182 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf_size230 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %182, i32 0, i32 12
  %183 = load i64, i64* %server_buf_size230, align 8
  %mul231 = mul i64 %183, 2
  store i64 %mul231, i64* %server_buf_size230, align 8
  %184 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf232 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %184, i32 0, i32 11
  %185 = load i8*, i8** %server_buf232, align 8
  %186 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf_size233 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %186, i32 0, i32 12
  %187 = load i64, i64* %server_buf_size233, align 8
  %call234 = call i8* @realloc(i8* %185, i64 %187) #7
  %188 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf235 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %188, i32 0, i32 11
  store i8* %call234, i8** %server_buf235, align 8
  %189 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf236 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %189, i32 0, i32 11
  %190 = load i8*, i8** %server_buf236, align 8
  %cmp237 = icmp eq i8* %190, null
  br i1 %cmp237, label %if.then239, label %if.end241

if.then239:                                       ; preds = %if.then229
  %191 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call240 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %191, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.31, i64 0, i64 0))
  br label %cleanup

if.end241:                                        ; preds = %if.then229
  br label %if.end242

if.end242:                                        ; preds = %if.end241, %if.else224
  br label %if.end243

if.end243:                                        ; preds = %if.end242, %if.end223
  br label %if.end244

if.end244:                                        ; preds = %if.end243
  br label %if.end245

if.end245:                                        ; preds = %if.end244
  br label %if.end246

if.end246:                                        ; preds = %if.end245, %if.end166
  br label %for.cond

cleanup:                                          ; preds = %if.then239, %if.then217, %if.then198, %if.then191, %if.then159, %if.then138, %if.then122, %if.then116, %if.then66, %if.then58, %if.then50, %if.then42, %if.then33, %if.then22, %if.then17, %if.then10, %if.then
  %192 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd247 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %192, i32 0, i32 3
  %193 = load i32, i32* %server_fd247, align 4
  %cmp248 = icmp sge i32 %193, 0
  br i1 %cmp248, label %if.then250, label %if.end253

if.then250:                                       ; preds = %cleanup
  %194 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_fd251 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %194, i32 0, i32 3
  %195 = load i32, i32* %server_fd251, align 4
  %call252 = call i32 @close(i32 %195)
  br label %if.end253

if.end253:                                        ; preds = %if.then250, %cleanup
  %196 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_fd254 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %196, i32 0, i32 2
  %197 = load i32, i32* %client_fd254, align 8
  %cmp255 = icmp sge i32 %197, 0
  br i1 %cmp255, label %if.then257, label %if.end260

if.then257:                                       ; preds = %if.end253
  %198 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_fd258 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %198, i32 0, i32 2
  %199 = load i32, i32* %client_fd258, align 8
  %call259 = call i32 @close(i32 %199)
  br label %if.end260

if.end260:                                        ; preds = %if.then257, %if.end253
  %200 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %client_buf261 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %200, i32 0, i32 8
  %201 = load i8*, i8** %client_buf261, align 8
  call void @free(i8* %201) #7
  %202 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %server_buf262 = getelementptr inbounds %struct.proxy_info, %struct.proxy_info* %202, i32 0, i32 11
  %203 = load i8*, i8** %server_buf262, align 8
  call void @free(i8* %203) #7
  %204 = load %struct.proxy_info*, %struct.proxy_info** %info, align 8
  %205 = bitcast %struct.proxy_info* %204 to i8*
  call void @free(i8* %205) #7
  ret i8* null
}

declare dso_local i32 @close(i32) #2

; Function Attrs: nounwind readonly
declare dso_local i8* @strrchr(i8*, i32) #5

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare dso_local i8* @strtok(i8*, i8*) #1

declare dso_local i32 @getaddrinfo(i8*, i8*, %struct.addrinfo*, %struct.addrinfo**) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local void @freeaddrinfo(%struct.addrinfo*) #1

; Function Attrs: nounwind
declare dso_local i32 @pthread_detach(i64) #1

; Function Attrs: nounwind readnone
declare dso_local i64 @pthread_self() #3

; Function Attrs: nounwind
declare dso_local i32 @getsockopt(i32, i32, i32, i8*, i32*) #1

declare dso_local i32 @sctp_connectx(i32, %struct.sockaddr*, i32, i32*) #2

declare dso_local i32 @select(i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timeval*) #2

declare dso_local i32 @sctp_recvmsg(i32, i8*, i64, %struct.sockaddr*, i32*, %struct.sctp_sndrcvinfo*, i32*) #2

declare dso_local i32 @sctp_sendmsg(i32, i8*, i64, %struct.sockaddr*, i32, i32, i32, i16 zeroext, i32, i32) #2

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn writeonly }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone }
attributes #9 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.1 (https://git.sjtu.edu.cn/sjtug/llvm-project.git 43ff75f2c3feef64f9d73328230d34dac8832a91)"}
!2 = !{i32 -2146783489}
