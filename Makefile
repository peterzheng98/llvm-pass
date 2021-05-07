llvmpass:
	ccache clang++ -I/mnt/ssd/llvm-project/llvm/include -I/mnt/ssd/llvm-project/build/include  -pedantic -Wall -Wextra -O2 -fno-rtti -fno-omit-frame-pointer -std=c++17 -o ir_test main.cpp element.cpp -L/mnt/ssd/llvm-project/build/lib -lLLVMXRay -lLLVMWindowsManifest -lLLVMTestingSupport -lLLVMTableGen -lLLVMSymbolize -lLLVMDebugInfoPDB -lLLVMOrcJIT -lLLVMOrcError -lLLVMJITLink -lLLVMObjectYAML -lLLVMMCA -lLLVMLTO -lLLVMPasses -lLLVMCoroutines -lLLVMObjCARCOpts -lLLVMExtensions -lLLVMLineEditor -lLLVMLibDriver -lLLVMInterpreter -lgtest_main -lgtest -lLLVMFuzzMutate -lLLVMMCJIT -lLLVMExecutionEngine -lLLVMRuntimeDyld -lLLVMDWARFLinker -lLLVMDlltoolDriver -lLLVMOption -lLLVMDebugInfoGSYM -lLLVMCoverage -lLLVMXCoreDisassembler -lLLVMXCoreCodeGen -lLLVMXCoreDesc -lLLVMXCoreInfo -lLLVMX86Disassembler -lLLVMX86AsmParser -lLLVMX86CodeGen -lLLVMX86Desc -lLLVMX86Info -lLLVMWebAssemblyDisassembler -lLLVMWebAssemblyCodeGen -lLLVMWebAssemblyDesc -lLLVMWebAssemblyAsmParser -lLLVMWebAssemblyInfo -lLLVMSystemZDisassembler -lLLVMSystemZCodeGen -lLLVMSystemZAsmParser -lLLVMSystemZDesc -lLLVMSystemZInfo -lLLVMSparcDisassembler -lLLVMSparcCodeGen -lLLVMSparcAsmParser -lLLVMSparcDesc -lLLVMSparcInfo -lLLVMRISCVDisassembler -lLLVMRISCVCodeGen -lLLVMRISCVAsmParser -lLLVMRISCVDesc -lLLVMRISCVUtils -lLLVMRISCVInfo -lLLVMPowerPCDisassembler -lLLVMPowerPCCodeGen -lLLVMPowerPCAsmParser -lLLVMPowerPCDesc -lLLVMPowerPCInfo -lLLVMNVPTXCodeGen -lLLVMNVPTXDesc -lLLVMNVPTXInfo -lLLVMMSP430Disassembler -lLLVMMSP430CodeGen -lLLVMMSP430AsmParser -lLLVMMSP430Desc -lLLVMMSP430Info -lLLVMMipsDisassembler -lLLVMMipsCodeGen -lLLVMMipsAsmParser -lLLVMMipsDesc -lLLVMMipsInfo -lLLVMLanaiDisassembler -lLLVMLanaiCodeGen -lLLVMLanaiAsmParser -lLLVMLanaiDesc -lLLVMLanaiInfo -lLLVMHexagonDisassembler -lLLVMHexagonCodeGen -lLLVMHexagonAsmParser -lLLVMHexagonDesc -lLLVMHexagonInfo -lLLVMBPFDisassembler -lLLVMBPFCodeGen -lLLVMBPFAsmParser -lLLVMBPFDesc -lLLVMBPFInfo -lLLVMAVRDisassembler -lLLVMAVRCodeGen -lLLVMAVRAsmParser -lLLVMAVRDesc -lLLVMAVRInfo -lLLVMARMDisassembler -lLLVMARMCodeGen -lLLVMARMAsmParser -lLLVMARMDesc -lLLVMARMUtils -lLLVMARMInfo -lLLVMAMDGPUDisassembler -lLLVMAMDGPUCodeGen -lLLVMMIRParser -lLLVMipo -lLLVMInstrumentation -lLLVMVectorize -lLLVMLinker -lLLVMIRReader -lLLVMAsmParser -lLLVMFrontendOpenMP -lLLVMAMDGPUAsmParser -lLLVMAMDGPUDesc -lLLVMAMDGPUUtils -lLLVMAMDGPUInfo -lLLVMAArch64Disassembler -lLLVMMCDisassembler -lLLVMAArch64CodeGen -lLLVMCFGuard -lLLVMGlobalISel -lLLVMSelectionDAG -lLLVMAsmPrinter -lLLVMDebugInfoDWARF -lLLVMCodeGen -lLLVMTarget -lLLVMScalarOpts -lLLVMInstCombine -lLLVMAggressiveInstCombine -lLLVMTransformUtils -lLLVMBitWriter -lLLVMAnalysis -lLLVMProfileData -lLLVMObject -lLLVMTextAPI -lLLVMBitReader -lLLVMCore -lLLVMRemarks -lLLVMBitstreamReader -lLLVMAArch64AsmParser -lLLVMMCParser -lLLVMAArch64Desc -lLLVMMC -lLLVMDebugInfoCodeView -lLLVMDebugInfoMSF -lLLVMBinaryFormat -lLLVMAArch64Utils -lLLVMAArch64Info -lLLVMSupport -lLLVMDemangle -lpthread -lncurses

llvmpass-dbg:
	ccache clang++ -I/mnt/ssd/llvm-project/llvm/include -I/mnt/ssd/llvm-project/build/include  -pedantic -Wall -Wextra -g -fno-rtti -fno-omit-frame-pointer -std=c++17 -o ir_test main.cpp element.cpp -L/mnt/ssd/llvm-project/build/lib -lLLVMXRay -lLLVMWindowsManifest -lLLVMTestingSupport -lLLVMTableGen -lLLVMSymbolize -lLLVMDebugInfoPDB -lLLVMOrcJIT -lLLVMOrcError -lLLVMJITLink -lLLVMObjectYAML -lLLVMMCA -lLLVMLTO -lLLVMPasses -lLLVMCoroutines -lLLVMObjCARCOpts -lLLVMExtensions -lLLVMLineEditor -lLLVMLibDriver -lLLVMInterpreter -lgtest_main -lgtest -lLLVMFuzzMutate -lLLVMMCJIT -lLLVMExecutionEngine -lLLVMRuntimeDyld -lLLVMDWARFLinker -lLLVMDlltoolDriver -lLLVMOption -lLLVMDebugInfoGSYM -lLLVMCoverage -lLLVMXCoreDisassembler -lLLVMXCoreCodeGen -lLLVMXCoreDesc -lLLVMXCoreInfo -lLLVMX86Disassembler -lLLVMX86AsmParser -lLLVMX86CodeGen -lLLVMX86Desc -lLLVMX86Info -lLLVMWebAssemblyDisassembler -lLLVMWebAssemblyCodeGen -lLLVMWebAssemblyDesc -lLLVMWebAssemblyAsmParser -lLLVMWebAssemblyInfo -lLLVMSystemZDisassembler -lLLVMSystemZCodeGen -lLLVMSystemZAsmParser -lLLVMSystemZDesc -lLLVMSystemZInfo -lLLVMSparcDisassembler -lLLVMSparcCodeGen -lLLVMSparcAsmParser -lLLVMSparcDesc -lLLVMSparcInfo -lLLVMRISCVDisassembler -lLLVMRISCVCodeGen -lLLVMRISCVAsmParser -lLLVMRISCVDesc -lLLVMRISCVUtils -lLLVMRISCVInfo -lLLVMPowerPCDisassembler -lLLVMPowerPCCodeGen -lLLVMPowerPCAsmParser -lLLVMPowerPCDesc -lLLVMPowerPCInfo -lLLVMNVPTXCodeGen -lLLVMNVPTXDesc -lLLVMNVPTXInfo -lLLVMMSP430Disassembler -lLLVMMSP430CodeGen -lLLVMMSP430AsmParser -lLLVMMSP430Desc -lLLVMMSP430Info -lLLVMMipsDisassembler -lLLVMMipsCodeGen -lLLVMMipsAsmParser -lLLVMMipsDesc -lLLVMMipsInfo -lLLVMLanaiDisassembler -lLLVMLanaiCodeGen -lLLVMLanaiAsmParser -lLLVMLanaiDesc -lLLVMLanaiInfo -lLLVMHexagonDisassembler -lLLVMHexagonCodeGen -lLLVMHexagonAsmParser -lLLVMHexagonDesc -lLLVMHexagonInfo -lLLVMBPFDisassembler -lLLVMBPFCodeGen -lLLVMBPFAsmParser -lLLVMBPFDesc -lLLVMBPFInfo -lLLVMAVRDisassembler -lLLVMAVRCodeGen -lLLVMAVRAsmParser -lLLVMAVRDesc -lLLVMAVRInfo -lLLVMARMDisassembler -lLLVMARMCodeGen -lLLVMARMAsmParser -lLLVMARMDesc -lLLVMARMUtils -lLLVMARMInfo -lLLVMAMDGPUDisassembler -lLLVMAMDGPUCodeGen -lLLVMMIRParser -lLLVMipo -lLLVMInstrumentation -lLLVMVectorize -lLLVMLinker -lLLVMIRReader -lLLVMAsmParser -lLLVMFrontendOpenMP -lLLVMAMDGPUAsmParser -lLLVMAMDGPUDesc -lLLVMAMDGPUUtils -lLLVMAMDGPUInfo -lLLVMAArch64Disassembler -lLLVMMCDisassembler -lLLVMAArch64CodeGen -lLLVMCFGuard -lLLVMGlobalISel -lLLVMSelectionDAG -lLLVMAsmPrinter -lLLVMDebugInfoDWARF -lLLVMCodeGen -lLLVMTarget -lLLVMScalarOpts -lLLVMInstCombine -lLLVMAggressiveInstCombine -lLLVMTransformUtils -lLLVMBitWriter -lLLVMAnalysis -lLLVMProfileData -lLLVMObject -lLLVMTextAPI -lLLVMBitReader -lLLVMCore -lLLVMRemarks -lLLVMBitstreamReader -lLLVMAArch64AsmParser -lLLVMMCParser -lLLVMAArch64Desc -lLLVMMC -lLLVMDebugInfoCodeView -lLLVMDebugInfoMSF -lLLVMBinaryFormat -lLLVMAArch64Utils -lLLVMAArch64Info -lLLVMSupport -lLLVMDemangle -lpthread -lncurses

parallel_executable:
	g++ -o parallel start.cpp element.cpp -std=c++17 -g -lpthread && cp parallel zipped_folder/memcached/

parallel_test:
	rm -rf readable/* && rm -rf trans/* && ./parallel top-config.txt main

simple-ir:
	cd zipped_folder/simple-demo && clang -S -emit-llvm source.c

simple-ir-test:
	./ir_test zipped_folder/simple-demo/source.ll

memcached:
	./ir_test zipped_folder/memcached/all-llvm-files/assoc.ll
	./ir_test zipped_folder/memcached/all-llvm-files/authfile.ll
	./ir_test zipped_folder/memcached/all-llvm-files/bipbuffer.ll
	./ir_test zipped_folder/memcached/all-llvm-files/cache.ll
	./ir_test zipped_folder/memcached/all-llvm-files/crawler.ll
	./ir_test zipped_folder/memcached/all-llvm-files/crc32c.ll
	./ir_test zipped_folder/memcached/all-llvm-files/daemon.ll
	./ir_test zipped_folder/memcached/all-llvm-files/extstore.ll
	./ir_test zipped_folder/memcached/all-llvm-files/hash.ll
	./ir_test zipped_folder/memcached/all-llvm-files/items.ll
	./ir_test zipped_folder/memcached/all-llvm-files/itoa_ljust.ll
	./ir_test zipped_folder/memcached/all-llvm-files/jenkins_hash.ll
	./ir_test zipped_folder/memcached/all-llvm-files/logger.ll
	./ir_test zipped_folder/memcached/all-llvm-files/memcached.ll
	./ir_test zipped_folder/memcached/all-llvm-files/murmur3_hash.ll
	./ir_test zipped_folder/memcached/all-llvm-files/proto_bin.ll
	./ir_test zipped_folder/memcached/all-llvm-files/proto_text.ll
	./ir_test zipped_folder/memcached/all-llvm-files/restart.ll
	./ir_test zipped_folder/memcached/all-llvm-files/slab_automove_extstore.ll
	./ir_test zipped_folder/memcached/all-llvm-files/slab_automove.ll
	./ir_test zipped_folder/memcached/all-llvm-files/slabs.ll
	./ir_test zipped_folder/memcached/all-llvm-files/stats_prefix.ll
	./ir_test zipped_folder/memcached/all-llvm-files/storage.ll
	./ir_test zipped_folder/memcached/all-llvm-files/thread.ll
	./ir_test zipped_folder/memcached/all-llvm-files/util.ll
