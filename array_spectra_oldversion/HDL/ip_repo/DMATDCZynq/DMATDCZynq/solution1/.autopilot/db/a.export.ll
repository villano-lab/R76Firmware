; ModuleID = 'C:/GIT/R5560_FRAMEWORK_45/ip_repo/DMATDCZynq/DMATDCZynq/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@swap_timeout = internal unnamed_addr global i1 false, align 1
@out_counter = internal unnamed_addr global i64 0, align 8
@obuffer_ack = internal unnamed_addr global i32 0, align 4
@memcpy_OC_a_OC_V_OC_s = internal unnamed_addr constant [12 x i8] c"memcpy.a.V.\00"
@lost_counter = internal unnamed_addr global i64 0, align 8
@llvm_global_ctors_1 = appending global [0 x void ()*] zeroinitializer
@llvm_global_ctors_0 = appending global [0 x i32] zeroinitializer
@inbuffer_pointer = internal unnamed_addr global i32 0, align 4
@inbuffer_V = internal unnamed_addr global [4096 x i32] zeroinitializer
@data_mover_str = internal unnamed_addr constant [11 x i8] c"data_mover\00"
@burstwrite_OC_region = internal unnamed_addr constant [18 x i8] c"burstwrite.region\00"
@buftimeout = internal unnamed_addr global i32 0, align 4
@bufstatus_1 = internal unnamed_addr global i1 false
@bufstatus_0 = internal unnamed_addr global i1 false
@bufsel = internal unnamed_addr global i1 false
@buf_p = internal unnamed_addr global i32 0, align 4
@bsq_1 = internal unnamed_addr global i64 0
@bsq_0 = internal unnamed_addr global i64 0
@bsc = internal unnamed_addr global i64 0, align 8
@RAM_1P_str = internal unnamed_addr constant [7 x i8] c"RAM_1P\00"
@p_str9 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str8 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str7 = private unnamed_addr constant [13 x i8] c"ap_ctrl_none\00", align 1
@p_str6 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1
@p_str5 = private unnamed_addr constant [5 x i8] c"both\00", align 1
@p_str4 = private unnamed_addr constant [5 x i8] c"axis\00", align 1
@p_str3 = private unnamed_addr constant [5 x i8] c"axil\00", align 1
@p_str21 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str2 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1
@p_str10 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [8 x i8] c"ap_ovld\00", align 1

declare i64 @llvm.part.select.i64(i64, i32, i32) nounwind readnone

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @data_mover(i32* %a_V, i64* %stream0_V_V, i32* %buffer_status, i32 %buffer_ack, [2 x i64]* %buffer_seq, [2 x i32]* %bufsize, i32* %debug_buffer_status, i32* %debug_bufsel_0, i32* %debug_buf0_p, i32* %debug_inbuffer_pointer, i64* %debug_dst_var_V, i1 zeroext %run, i32 %DDROFFSET_V, [4 x i64]* %stat_counter, i1* %interrupt_r) {
.preheader96.preheader:
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %a_V), !map !60
  call void (...)* @_ssdm_op_SpecBitsMap(i64* %stream0_V_V), !map !66
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %buffer_status), !map !70
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %buffer_ack), !map !74
  call void (...)* @_ssdm_op_SpecBitsMap([2 x i64]* %buffer_seq), !map !80
  call void (...)* @_ssdm_op_SpecBitsMap([2 x i32]* %bufsize), !map !86
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %debug_buffer_status), !map !90
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %debug_bufsel_0), !map !94
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %debug_buf0_p), !map !98
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %debug_inbuffer_pointer), !map !102
  call void (...)* @_ssdm_op_SpecBitsMap(i64* %debug_dst_var_V), !map !106
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %run), !map !110
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %DDROFFSET_V), !map !114
  call void (...)* @_ssdm_op_SpecBitsMap([4 x i64]* %stat_counter), !map !118
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %interrupt_r), !map !124
  %DDROFFSET_V_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %DDROFFSET_V)
  %run_read = call i1 @_ssdm_op_Read.s_axilite.i1(i1 %run)
  %buffer_ack_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %buffer_ack)
  %stat_counter_addr = getelementptr [4 x i64]* %stat_counter, i64 0, i64 0
  call void (...)* @_ssdm_op_SpecTopModule([11 x i8]* @data_mover_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i1* %interrupt_r, [8 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecMemCore([4 x i64]* %stat_counter, [1 x i8]* @p_str10, [7 x i8]* @RAM_1P_str, [1 x i8]* @p_str10, i32 -1, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10, [1 x i8]* @p_str10)
  call void (...)* @_ssdm_op_SpecInterface([4 x i64]* %stat_counter, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [5 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %DDROFFSET_V, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [5 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i1 %run, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [5 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i64* %debug_dst_var_V, [8 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %debug_inbuffer_pointer, [8 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %debug_buf0_p, [8 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %debug_bufsel_0, [8 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %debug_buffer_status, [8 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %empty_7 = call i32 (...)* @_ssdm_op_SpecMemCore([2 x i32]* %bufsize, [1 x i8]* @p_str9, [7 x i8]* @RAM_1P_str, [1 x i8]* @p_str9, i32 -1, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [1 x i8]* @p_str9, [1 x i8]* @p_str9)
  call void (...)* @_ssdm_op_SpecInterface([2 x i32]* %bufsize, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [5 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %empty_8 = call i32 (...)* @_ssdm_op_SpecMemCore([2 x i64]* %buffer_seq, [1 x i8]* @p_str8, [7 x i8]* @RAM_1P_str, [1 x i8]* @p_str8, i32 -1, [1 x i8]* @p_str8, [1 x i8]* @p_str8, [1 x i8]* @p_str8, [1 x i8]* @p_str8, [1 x i8]* @p_str8)
  call void (...)* @_ssdm_op_SpecInterface([2 x i64]* %buffer_seq, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [5 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %buffer_ack, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [5 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %buffer_status, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [5 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i64* %stream0_V_V, [5 x i8]* @p_str4, i32 1, i32 1, [5 x i8]* @p_str5, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %a_V, [6 x i8]* @p_str6, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 32, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [13 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %bufstatus_0_load = load i1* @bufstatus_0, align 1
  %bufstatus_1_load = load i1* @bufstatus_1, align 1
  %inbuffer_pointer_loa = load i32* @inbuffer_pointer, align 4
  %out_counter_load = load i64* @out_counter, align 8
  %lost_counter_load = load i64* @lost_counter, align 8
  %buftimeout_load = load i32* @buftimeout, align 4
  br i1 %run_read, label %0, label %3

; <label>:0                                       ; preds = %.preheader96.preheader
  %bufsel_load = load i1* @bufsel, align 1
  %tmp_3 = zext i1 %bufsel_load to i64
  %bufstatus_load_phi = select i1 %bufsel_load, i1 %bufstatus_1_load, i1 %bufstatus_0_load
  %swap_timeout_load = load i1* @swap_timeout, align 1
  %buf_p_load = load i32* @buf_p, align 4
  br i1 %bufstatus_load_phi, label %.critedge, label %1

; <label>:1                                       ; preds = %0
  %tmp = call i1 @_ssdm_op_NbReadReq.axis.i64P(i64* %stream0_V_V, i32 1)
  br i1 %tmp, label %2, label %.critedge93

; <label>:2                                       ; preds = %1
  %tmp_V = call i64 @_ssdm_op_Read.axis.volatile.i64P(i64* %stream0_V_V)
  %tmp_7 = add nsw i32 1, %inbuffer_pointer_loa
  %tmp_8 = sext i32 %inbuffer_pointer_loa to i64
  %tmp_13 = trunc i64 %tmp_V to i32
  %inbuffer_V_addr = getelementptr [4096 x i32]* @inbuffer_V, i64 0, i64 %tmp_8
  store i32 %tmp_13, i32* %inbuffer_V_addr, align 4
  %tmp_9 = add nsw i32 2, %inbuffer_pointer_loa
  %tmp_s = sext i32 %tmp_7 to i64
  %p_Result_1 = call i32 @_ssdm_op_PartSelect.i32.i64.i32.i32(i64 %tmp_V, i32 32, i32 63)
  %inbuffer_V_addr_1 = getelementptr [4096 x i32]* @inbuffer_V, i64 0, i64 %tmp_s
  store i32 %p_Result_1, i32* %inbuffer_V_addr_1, align 4
  call void @_ssdm_op_Write.ap_ovld.i32P(i32* %debug_inbuffer_pointer, i32 %tmp_9)
  %tmp_5 = icmp eq i32 %tmp_9, 4096
  %tmp_6 = add i64 1, %out_counter_load
  store i64 %tmp_6, i64* @out_counter, align 8
  call void @_ssdm_op_Write.ap_ovld.i64P(i64* %debug_dst_var_V, i64 %tmp_V)
  br i1 %tmp_5, label %._crit_edge101, label %.critedge93

.critedge:                                        ; preds = %0
  %tmp_4 = add i64 %lost_counter_load, 1
  store i64 %tmp_4, i64* @lost_counter, align 8
  br label %.critedge93

.critedge93:                                      ; preds = %.critedge, %2, %1
  %inbuffer_pointer_fla = phi i1 [ false, %.critedge ], [ true, %2 ], [ false, %1 ]
  %inbuffer_pointer_loc = phi i32 [ %inbuffer_pointer_loa, %.critedge ], [ %tmp_9, %2 ], [ %inbuffer_pointer_loa, %1 ]
  %out_counter_loc = phi i64 [ %out_counter_load, %.critedge ], [ %tmp_6, %2 ], [ %out_counter_load, %1 ]
  %lost_counter_loc = phi i64 [ %tmp_4, %.critedge ], [ %lost_counter_load, %2 ], [ %lost_counter_load, %1 ]
  %swap_timeout_load_no = xor i1 %swap_timeout_load, true
  %brmerge = or i1 %bufstatus_load_phi, %swap_timeout_load_no
  br i1 %brmerge, label %.critedge93._crit_edge103, label %._crit_edge101

._crit_edge101:                                   ; preds = %.critedge93, %2
  %inbuffer_pointer_loc_1 = phi i32 [ %inbuffer_pointer_loc, %.critedge93 ], [ 4096, %2 ]
  %out_counter_loc_1 = phi i64 [ %out_counter_loc, %.critedge93 ], [ %tmp_6, %2 ]
  %lost_counter_loc_1 = phi i64 [ %lost_counter_loc, %.critedge93 ], [ %lost_counter_load, %2 ]
  %tmp_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %DDROFFSET_V_read, i32 2, i32 31)
  %op2_cast = zext i30 %tmp_1 to i31
  %tmp_2_cast = sext i32 %buf_p_load to i33
  %tmp_2 = call i23 @_ssdm_op_BitConcatenate.i23.i1.i22(i1 %bufsel_load, i22 0)
  %tmp_11_cast = zext i23 %tmp_2 to i31
  %tmp3 = add i31 %tmp_11_cast, %op2_cast
  %tmp3_cast = zext i31 %tmp3 to i33
  %p_sum1 = add i33 %tmp3_cast, %tmp_2_cast
  %p_sum1_cast = sext i33 %p_sum1 to i64
  %a_V_addr = getelementptr i32* %a_V, i64 %p_sum1_cast
  %a_V_addr_wr_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %a_V_addr, i32 4096)
  br label %burst.wr.header

burst.wr.header:                                  ; preds = %burst.wr.body, %._crit_edge101
  %indvar = phi i13 [ 0, %._crit_edge101 ], [ %indvar_next, %burst.wr.body ]
  %exitcond3 = icmp eq i13 %indvar, -4096
  %indvar_next = add i13 %indvar, 1
  br i1 %exitcond3, label %memcpy.tail, label %burst.wr.body

burst.wr.body:                                    ; preds = %burst.wr.header
  %empty_9 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 4096, i64 4096, i64 4096)
  %burstwrite_rbegin = call i32 (...)* @_ssdm_op_SpecRegionBegin([18 x i8]* @burstwrite_OC_region)
  %empty_10 = call i32 (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str21)
  call void (...)* @_ssdm_op_SpecLoopName([12 x i8]* @memcpy_OC_a_OC_V_OC_s)
  %tmp_12 = zext i13 %indvar to i64
  %inbuffer_V_addr_2 = getelementptr [4096 x i32]* @inbuffer_V, i64 0, i64 %tmp_12
  %inbuffer_V_load = load i32* %inbuffer_V_addr_2, align 4
  call void @_ssdm_op_Write.m_axi.i32P(i32* %a_V_addr, i32 %inbuffer_V_load, i4 -1)
  %burstwrite_rend = call i32 (...)* @_ssdm_op_SpecRegionEnd([18 x i8]* @burstwrite_OC_region, i32 %burstwrite_rbegin)
  br label %burst.wr.header

memcpy.tail:                                      ; preds = %burst.wr.header
  %a_V_addr_wr_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %a_V_addr)
  %tmp_10 = add nsw i32 %buf_p_load, %inbuffer_pointer_loc_1
  %tmp_11 = icmp eq i32 %tmp_10, 4194304
  %brmerge1 = or i1 %swap_timeout_load, %tmp_11
  br i1 %brmerge1, label %._crit_edge105, label %.critedge93._crit_edge103

._crit_edge105:                                   ; preds = %memcpy.tail
  %not_bufsel_load_t = xor i1 %bufsel_load, true
  %bufstatus_0_load_s = or i1 %bufstatus_0_load, %not_bufsel_load_t
  %p_bufstatus_1_load = or i1 %bufstatus_1_load, %bufsel_load
  %bufsize_addr_2 = getelementptr [2 x i32]* %bufsize, i64 0, i64 %tmp_3
  store i32 %tmp_10, i32* %bufsize_addr_2, align 4
  store i1 %not_bufsel_load_t, i1* @bufsel, align 1
  %bsc_load = load i64* @bsc, align 8
  %tmp_14 = add i64 %bsc_load, 1
  store i64 %tmp_14, i64* @bsc, align 8
  br i1 %bufsel_load, label %branch4, label %branch5

._crit_edge10828:                                 ; preds = %branch5, %branch4
  %bsq_0_load = load i64* @bsq_0, align 16
  %buffer_seq_addr_2 = getelementptr [2 x i64]* %buffer_seq, i64 0, i64 0
  store i64 %bsq_0_load, i64* %buffer_seq_addr_2, align 8
  %bsq_1_load = load i64* @bsq_1, align 8
  %buffer_seq_addr_3 = getelementptr [2 x i64]* %buffer_seq, i64 0, i64 1
  store i64 %bsq_1_load, i64* %buffer_seq_addr_3, align 8
  call void @_ssdm_op_Write.ap_ovld.i1P(i1* %interrupt_r, i1 true)
  br label %.critedge93._crit_edge103

.critedge93._crit_edge103:                        ; preds = %._crit_edge10828, %memcpy.tail, %.critedge93
  %bufstatus_0_flag_1 = phi i1 [ false, %.critedge93 ], [ %not_bufsel_load_t, %._crit_edge10828 ], [ false, %memcpy.tail ]
  %bufstatus_0_loc_1 = phi i1 [ %bufstatus_0_load, %.critedge93 ], [ %bufstatus_0_load_s, %._crit_edge10828 ], [ %bufstatus_0_load, %memcpy.tail ]
  %bufstatus_1_flag_1 = phi i1 [ false, %.critedge93 ], [ %bufsel_load, %._crit_edge10828 ], [ false, %memcpy.tail ]
  %bufstatus_1_loc_1 = phi i1 [ %bufstatus_1_load, %.critedge93 ], [ %p_bufstatus_1_load, %._crit_edge10828 ], [ %bufstatus_1_load, %memcpy.tail ]
  %inbuffer_pointer_fla_1 = phi i1 [ %inbuffer_pointer_fla, %.critedge93 ], [ true, %._crit_edge10828 ], [ true, %memcpy.tail ]
  %inbuffer_pointer_new_1 = phi i32 [ %inbuffer_pointer_loc, %.critedge93 ], [ 0, %._crit_edge10828 ], [ 0, %memcpy.tail ]
  %out_counter_loc_2 = phi i64 [ %out_counter_loc, %.critedge93 ], [ %out_counter_loc_1, %._crit_edge10828 ], [ %out_counter_loc_1, %memcpy.tail ]
  %lost_counter_loc_2 = phi i64 [ %lost_counter_loc, %.critedge93 ], [ %lost_counter_loc_1, %._crit_edge10828 ], [ %lost_counter_loc_1, %memcpy.tail ]
  %swap_timeout_flag = phi i1 [ false, %.critedge93 ], [ true, %._crit_edge10828 ], [ false, %memcpy.tail ]
  %buf_p_flag = phi i1 [ false, %.critedge93 ], [ true, %._crit_edge10828 ], [ true, %memcpy.tail ]
  %buf_p_loc = phi i32 [ %buf_p_load, %.critedge93 ], [ 0, %._crit_edge10828 ], [ %tmp_10, %memcpy.tail ]
  %buftimeout_loc = phi i32 [ %buftimeout_load, %.critedge93 ], [ 0, %._crit_edge10828 ], [ %buftimeout_load, %memcpy.tail ]
  %bufsel_load_3 = phi i1 [ %bufsel_load, %.critedge93 ], [ %not_bufsel_load_t, %._crit_edge10828 ], [ %bufsel_load, %memcpy.tail ]
  %bufsel_load_3_cast = zext i1 %bufsel_load_3 to i32
  %tmp_15 = zext i1 %bufstatus_0_loc_1 to i32
  %tmp_16 = call i32 @_ssdm_op_BitSet.i32.i32.i32.i1(i32 %tmp_15, i32 1, i1 %bufstatus_1_loc_1)
  call void @_ssdm_op_Write.s_axilite.i32P(i32* %buffer_status, i32 %tmp_16)
  %obuffer_ack_load = load i32* @obuffer_ack, align 4
  %tmp_17 = trunc i32 %obuffer_ack_load to i1
  %tmp_18 = xor i1 %tmp_17, true
  br i1 %buf_p_flag, label %mergeST37, label %.critedge93._crit_edge103.new_ifconv

; <label>:3                                       ; preds = %.preheader96.preheader
  store i1 false, i1* @bufsel, align 1
  store i32 0, i32* @obuffer_ack, align 4
  call void @_ssdm_op_Write.s_axilite.i32P(i32* %buffer_status, i32 0)
  store i64 0, i64* @bsc, align 8
  store i64 0, i64* @out_counter, align 8
  store i64 0, i64* @lost_counter, align 8
  %buffer_seq_addr = getelementptr [2 x i64]* %buffer_seq, i64 0, i64 0
  store i64 0, i64* %buffer_seq_addr, align 8
  %bufsize_addr = getelementptr [2 x i32]* %bufsize, i64 0, i64 0
  store i32 0, i32* %bufsize_addr, align 4
  %buffer_seq_addr_1 = getelementptr [2 x i64]* %buffer_seq, i64 0, i64 1
  store i64 0, i64* %buffer_seq_addr_1, align 8
  %bufsize_addr_1 = getelementptr [2 x i32]* %bufsize, i64 0, i64 1
  store i32 0, i32* %bufsize_addr_1, align 4
  call void @_ssdm_op_Write.ap_ovld.i1P(i1* %interrupt_r, i1 false)
  br label %mergeST38

branch4:                                          ; preds = %._crit_edge105
  store i64 %tmp_14, i64* @bsq_0, align 8
  br label %._crit_edge10828

branch5:                                          ; preds = %._crit_edge105
  store i64 %tmp_14, i64* @bsq_1, align 8
  br label %._crit_edge10828

mergeST:                                          ; preds = %.new32
  store i1 %bufstatus_0_new_3, i1* @bufstatus_0, align 1
  br label %.new

.new:                                             ; preds = %.new32, %mergeST
  ret void

mergeST31:                                        ; preds = %.new34
  store i1 %bufstatus_1_new_3, i1* @bufstatus_1, align 1
  br label %.new32

.new32:                                           ; preds = %.new34, %mergeST31
  br i1 %bufstatus_0_flag_3, label %mergeST, label %.new

mergeST33:                                        ; preds = %mergeST38
  store i32 %inbuffer_pointer_new_2, i32* @inbuffer_pointer, align 4
  br label %.new34

.new34:                                           ; preds = %mergeST38, %mergeST33
  br i1 %bufstatus_1_flag_3, label %mergeST31, label %.new32

mergeST35:                                        ; preds = %.critedge93._crit_edge103.new_ifconv
  store i1 %tmp_23, i1* @swap_timeout, align 1
  br label %.new36

.new36:                                           ; preds = %.critedge93._crit_edge103.new_ifconv, %mergeST35
  br label %mergeST38

mergeST37:                                        ; preds = %.critedge93._crit_edge103
  store i32 %buf_p_loc, i32* @buf_p, align 4
  br label %.critedge93._crit_edge103.new_ifconv

.critedge93._crit_edge103.new_ifconv:             ; preds = %mergeST37, %.critedge93._crit_edge103
  %tmp_25 = trunc i32 %buffer_ack_read to i1
  %tmp_19 = xor i1 %tmp_25, true
  %bufstatus_0_flag_1_s = and i1 %tmp_25, %tmp_18
  %bufstatus_0_flag_2 = or i1 %bufstatus_0_flag_1, %bufstatus_0_flag_1_s
  %bufstatus_0_new_2 = or i1 %tmp_17, %tmp_19
  %bufstatus_load_4 = and i1 %bufstatus_0_loc_1, %bufstatus_0_new_2
  %tmp_26 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %obuffer_ack_load, i32 1)
  %rev = xor i1 %tmp_26, true
  %tmp_27 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %buffer_ack_read, i32 1)
  %rev8 = xor i1 %tmp_27, true
  %bufstatus_1_flag_1_s = and i1 %tmp_27, %rev
  %bufstatus_1_flag_2 = or i1 %bufstatus_1_flag_1, %bufstatus_1_flag_1_s
  %bufstatus_1_new_2 = or i1 %tmp_26, %rev8
  %bufstatus_load_5 = and i1 %bufstatus_1_loc_1, %bufstatus_1_new_2
  store i32 %buffer_ack_read, i32* @obuffer_ack, align 4
  call void @_ssdm_op_Write.ap_ovld.i32P(i32* %debug_bufsel_0, i32 %bufsel_load_3_cast)
  call void @_ssdm_op_Write.ap_ovld.i32P(i32* %debug_buf0_p, i32 %buf_p_loc)
  %tmp_20 = zext i1 %bufstatus_load_4 to i32
  %tmp_21 = call i32 @_ssdm_op_BitSet.i32.i32.i32.i1(i32 %tmp_20, i32 1, i1 %bufstatus_load_5)
  call void @_ssdm_op_Write.ap_ovld.i32P(i32* %debug_buffer_status, i32 %tmp_21)
  store i64 0, i64* %stat_counter_addr, align 8
  %stat_counter_addr_1 = getelementptr [4 x i64]* %stat_counter, i64 0, i64 1
  store i64 %out_counter_loc_2, i64* %stat_counter_addr_1, align 8
  %stat_counter_addr_2 = getelementptr [4 x i64]* %stat_counter, i64 0, i64 2
  store i64 %lost_counter_loc_2, i64* %stat_counter_addr_2, align 8
  %tmp_22 = zext i32 %buftimeout_loc to i64
  %stat_counter_addr_3 = getelementptr [4 x i64]* %stat_counter, i64 0, i64 4
  store i64 %tmp_22, i64* %stat_counter_addr_3, align 8
  %tmp_23 = icmp eq i32 %buftimeout_loc, 10000000
  %tmp_24 = add i32 1, %buftimeout_loc
  %swap_timeout_flag_1 = or i1 %tmp_23, %swap_timeout_flag
  %storemerge = select i1 %tmp_23, i32 0, i32 %tmp_24
  br i1 %swap_timeout_flag_1, label %mergeST35, label %.new36

mergeST38:                                        ; preds = %.new36, %3
  %bufstatus_0_flag_3 = phi i1 [ %bufstatus_0_flag_2, %.new36 ], [ true, %3 ]
  %bufstatus_0_new_3 = phi i1 [ %bufstatus_0_new_2, %.new36 ], [ false, %3 ]
  %bufstatus_1_flag_3 = phi i1 [ %bufstatus_1_flag_2, %.new36 ], [ true, %3 ]
  %bufstatus_1_new_3 = phi i1 [ %bufstatus_1_new_2, %.new36 ], [ false, %3 ]
  %inbuffer_pointer_fla_2 = phi i1 [ %inbuffer_pointer_fla_1, %.new36 ], [ true, %3 ]
  %inbuffer_pointer_new_2 = phi i32 [ %inbuffer_pointer_new_1, %.new36 ], [ 0, %3 ]
  %buftimeout_new = phi i32 [ %storemerge, %.new36 ], [ 0, %3 ]
  store i32 %buftimeout_new, i32* @buftimeout, align 4
  br i1 %inbuffer_pointer_fla_2, label %mergeST33, label %.new34
}

define weak i1 @_ssdm_op_WriteResp.m_axi.i32P(i32*) {
entry:
  ret i1 true
}

define weak i1 @_ssdm_op_WriteReq.m_axi.i32P(i32*, i32) {
entry:
  ret i1 true
}

define weak void @_ssdm_op_Write.s_axilite.i32P(i32*, i32) {
entry:
  store i32 %1, i32* %0
  ret void
}

define weak void @_ssdm_op_Write.m_axi.i32P(i32*, i32, i4) {
entry:
  ret void
}

define weak void @_ssdm_op_Write.ap_ovld.i64P(i64*, i64) {
entry:
  store i64 %1, i64* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_ovld.i32P(i32*, i32) {
entry:
  store i32 %1, i32* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_ovld.i1P(i1*, i1) {
entry:
  store i1 %1, i1* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecPipeline(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecMemCore(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_Read.s_axilite.i32(i32) {
entry:
  ret i32 %0
}

define weak i1 @_ssdm_op_Read.s_axilite.i1(i1) {
entry:
  ret i1 %0
}

define weak i64 @_ssdm_op_Read.axis.volatile.i64P(i64*) {
entry:
  %empty = load i64* %0
  ret i64 %empty
}

define weak i32 @_ssdm_op_PartSelect.i32.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_11 = trunc i64 %empty to i32
  ret i32 %empty_11
}

define weak i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_12 = trunc i32 %empty to i30
  ret i30 %empty_12
}

declare i2 @_ssdm_op_PartSelect.i2.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i1 @_ssdm_op_PartSelect.i1.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i1 @_ssdm_op_NbReadReq.axis.i64P(i64*, i32) {
entry:
  ret i1 true
}

define weak i32 @_ssdm_op_BitSet.i32.i32.i32.i1(i32, i32, i1) nounwind readnone {
entry:
  %empty = icmp ne i1 %2, false
  %empty_13 = zext i1 %empty to i32
  %empty_14 = bitcast i32 %1 to i32
  %empty_15 = shl i32 %empty_13, %empty_14
  %empty_16 = shl i32 1, %empty_14
  %empty_17 = xor i32 %empty_16, -1
  %empty_18 = and i32 %empty_17, %0
  %empty_19 = or i32 %empty_15, %empty_18
  ret i32 %empty_19
}

define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1
  %empty_20 = and i32 %0, %empty
  %empty_21 = icmp ne i32 %empty_20, 0
  ret i1 %empty_21
}

define weak i1 @_ssdm_op_BitSelect.i1.i2.i32(i2, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i2
  %empty_22 = shl i2 1, %empty
  %empty_23 = and i2 %0, %empty_22
  %empty_24 = icmp ne i2 %empty_23, 0
  ret i1 %empty_24
}

define weak i23 @_ssdm_op_BitConcatenate.i23.i1.i22(i1, i22) nounwind readnone {
entry:
  %empty = zext i1 %0 to i23
  %empty_25 = zext i22 %1 to i23
  %empty_26 = shl i23 %empty, 22
  %empty_27 = or i23 %empty_26, %empty_25
  ret i23 %empty_27
}

!opencl.kernels = !{!0, !7, !13, !19, !24, !24, !13, !30, !13, !13, !13, !33, !36, !36, !36, !13, !13, !13, !13, !13, !39, !41, !44, !44, !50, !13, !13, !13, !13, !13, !13}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!53}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 1, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"ram_word*", metadata !"stream<bus_word>", metadata !"int*", metadata !"int", metadata !"uint64_t*", metadata !"uint32_t*", metadata !"int*", metadata !"int*", metadata !"int*", metadata !"int*", metadata !"bus_word*", metadata !"_Bool", metadata !"ap_uint<32>", metadata !"uint64_t*", metadata !"_Bool*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"volatile", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"a", metadata !"stream0", metadata !"buffer_status", metadata !"buffer_ack", metadata !"buffer_seq", metadata !"bufsize", metadata !"debug_buffer_status", metadata !"debug_bufsel_0", metadata !"debug_buf0_p", metadata !"debug_inbuffer_pointer", metadata !"debug_dst_var", metadata !"run", metadata !"DDROFFSET", metadata !"stat_counter", metadata !"interrupt_r"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_uint<32>*", metadata !"const ap_int_base<33, true> &"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !"volatile", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"i_op", metadata !"op"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space"}
!15 = metadata !{metadata !"kernel_arg_access_qual"}
!16 = metadata !{metadata !"kernel_arg_type"}
!17 = metadata !{metadata !"kernel_arg_type_qual"}
!18 = metadata !{metadata !"kernel_arg_name"}
!19 = metadata !{null, metadata !20, metadata !9, metadata !21, metadata !22, metadata !23, metadata !6}
!20 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!21 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"int"}
!22 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!23 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!24 = metadata !{null, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !6}
!25 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!26 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!27 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!28 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!29 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!30 = metadata !{null, metadata !20, metadata !9, metadata !31, metadata !22, metadata !32, metadata !6}
!31 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"const ap_int_base<32, true> &"}
!32 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!33 = metadata !{null, metadata !25, metadata !26, metadata !34, metadata !28, metadata !35, metadata !6}
!34 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<64> &"}
!35 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!36 = metadata !{null, metadata !25, metadata !26, metadata !37, metadata !28, metadata !38, metadata !6}
!37 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<64, false> &"}
!38 = metadata !{metadata !"kernel_arg_name", metadata !"ref"}
!39 = metadata !{null, metadata !25, metadata !26, metadata !40, metadata !28, metadata !35, metadata !6}
!40 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<32> &"}
!41 = metadata !{null, metadata !20, metadata !9, metadata !42, metadata !22, metadata !43, metadata !6}
!42 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"int"}
!43 = metadata !{metadata !"kernel_arg_name", metadata !"Hi", metadata !"Lo"}
!44 = metadata !{null, metadata !45, metadata !46, metadata !47, metadata !48, metadata !49, metadata !6}
!45 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 0}
!46 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!47 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<64, false>*", metadata !"int", metadata !"int"}
!48 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!49 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"h", metadata !"l"}
!50 = metadata !{null, metadata !25, metadata !26, metadata !51, metadata !28, metadata !52, metadata !6}
!51 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_uint<64> &"}
!52 = metadata !{metadata !"kernel_arg_name", metadata !"dout"}
!53 = metadata !{metadata !54, [0 x i32]* @llvm_global_ctors_0}
!54 = metadata !{metadata !55}
!55 = metadata !{i32 0, i32 31, metadata !56}
!56 = metadata !{metadata !57}
!57 = metadata !{metadata !"llvm.global_ctors.0", metadata !58, metadata !"", i32 0, i32 31}
!58 = metadata !{metadata !59}
!59 = metadata !{i32 0, i32 0, i32 1}
!60 = metadata !{metadata !61}
!61 = metadata !{i32 0, i32 31, metadata !62}
!62 = metadata !{metadata !63}
!63 = metadata !{metadata !"a.V", metadata !64, metadata !"uint32", i32 0, i32 31}
!64 = metadata !{metadata !65}
!65 = metadata !{i32 0, i32 31, i32 1}
!66 = metadata !{metadata !67}
!67 = metadata !{i32 0, i32 63, metadata !68}
!68 = metadata !{metadata !69}
!69 = metadata !{metadata !"stream0.V.V", metadata !58, metadata !"uint64", i32 0, i32 63}
!70 = metadata !{metadata !71}
!71 = metadata !{i32 0, i32 31, metadata !72}
!72 = metadata !{metadata !73}
!73 = metadata !{metadata !"buffer_status", metadata !58, metadata !"int", i32 0, i32 31}
!74 = metadata !{metadata !75}
!75 = metadata !{i32 0, i32 31, metadata !76}
!76 = metadata !{metadata !77}
!77 = metadata !{metadata !"buffer_ack", metadata !78, metadata !"int", i32 0, i32 31}
!78 = metadata !{metadata !79}
!79 = metadata !{i32 0, i32 0, i32 0}
!80 = metadata !{metadata !81}
!81 = metadata !{i32 0, i32 63, metadata !82}
!82 = metadata !{metadata !83}
!83 = metadata !{metadata !"buffer_seq", metadata !84, metadata !"long long unsigned int", i32 0, i32 63}
!84 = metadata !{metadata !85}
!85 = metadata !{i32 0, i32 1, i32 1}
!86 = metadata !{metadata !87}
!87 = metadata !{i32 0, i32 31, metadata !88}
!88 = metadata !{metadata !89}
!89 = metadata !{metadata !"bufsize", metadata !84, metadata !"unsigned int", i32 0, i32 31}
!90 = metadata !{metadata !91}
!91 = metadata !{i32 0, i32 31, metadata !92}
!92 = metadata !{metadata !93}
!93 = metadata !{metadata !"debug_buffer_status", metadata !58, metadata !"int", i32 0, i32 31}
!94 = metadata !{metadata !95}
!95 = metadata !{i32 0, i32 31, metadata !96}
!96 = metadata !{metadata !97}
!97 = metadata !{metadata !"debug_bufsel_0", metadata !58, metadata !"int", i32 0, i32 31}
!98 = metadata !{metadata !99}
!99 = metadata !{i32 0, i32 31, metadata !100}
!100 = metadata !{metadata !101}
!101 = metadata !{metadata !"debug_buf0_p", metadata !58, metadata !"int", i32 0, i32 31}
!102 = metadata !{metadata !103}
!103 = metadata !{i32 0, i32 31, metadata !104}
!104 = metadata !{metadata !105}
!105 = metadata !{metadata !"debug_inbuffer_pointer", metadata !58, metadata !"int", i32 0, i32 31}
!106 = metadata !{metadata !107}
!107 = metadata !{i32 0, i32 63, metadata !108}
!108 = metadata !{metadata !109}
!109 = metadata !{metadata !"debug_dst_var.V", metadata !58, metadata !"uint64", i32 0, i32 63}
!110 = metadata !{metadata !111}
!111 = metadata !{i32 0, i32 0, metadata !112}
!112 = metadata !{metadata !113}
!113 = metadata !{metadata !"run", metadata !78, metadata !"bool", i32 0, i32 0}
!114 = metadata !{metadata !115}
!115 = metadata !{i32 0, i32 31, metadata !116}
!116 = metadata !{metadata !117}
!117 = metadata !{metadata !"DDROFFSET.V", metadata !78, metadata !"uint32", i32 0, i32 31}
!118 = metadata !{metadata !119}
!119 = metadata !{i32 0, i32 63, metadata !120}
!120 = metadata !{metadata !121}
!121 = metadata !{metadata !"stat_counter", metadata !122, metadata !"long long unsigned int", i32 0, i32 63}
!122 = metadata !{metadata !123}
!123 = metadata !{i32 0, i32 3, i32 1}
!124 = metadata !{metadata !125}
!125 = metadata !{i32 0, i32 0, metadata !126}
!126 = metadata !{metadata !127}
!127 = metadata !{metadata !"interrupt_r", metadata !58, metadata !"bool", i32 0, i32 0}
