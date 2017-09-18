; ModuleID = '/home/jose/tfg.jose.jimenez/VivadoHLS/AStarStatic/AStarStaticHLS/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@openNodes = internal unnamed_addr global [2304 x i1] zeroinitializer
@node_visited = internal unnamed_addr global [2304 x i1] zeroinitializer
@node_heuristic = internal unnamed_addr global [2304 x i32] zeroinitializer
@node_father = internal unnamed_addr global [2304 x i32] zeroinitializer
@node_costPlusHeuristic = internal unnamed_addr global [2304 x i32] zeroinitializer
@node_cost = internal unnamed_addr global [2304 x i32] zeroinitializer
@node_coordinates_1 = internal unnamed_addr global [2304 x i32] zeroinitializer
@node_coordinates_0 = internal global [2304 x i6] zeroinitializer
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@adjacentPosition_2 = internal unnamed_addr global [8 x i32] zeroinitializer
@adjacentPosition_1 = internal unnamed_addr global [8 x i32] zeroinitializer
@adjacentPosition_0 = internal unnamed_addr global [8 x i32] zeroinitializer
@aStar_str = internal unnamed_addr constant [6 x i8] c"aStar\00"
@p_str3 = private unnamed_addr constant [5 x i8] c"FOR2\00", align 1
@p_str2 = private unnamed_addr constant [5 x i8] c"FOR1\00", align 1
@p_str1 = private unnamed_addr constant [23 x i8] c"FORcalculateBestOption\00", align 1
@p_str = private unnamed_addr constant [13 x i8] c"ForinitNodes\00", align 1

declare i4 @llvm.part.select.i4(i4, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define internal fastcc void @aStar_calculateCost(i4 %i, i32 %position) {
  %position_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %position)
  %i_read = call i4 @_ssdm_op_Read.ap_auto.i4(i4 %i)
  %tmp = call i2 @_ssdm_op_PartSelect.i2.i4.i32.i32(i4 %i_read, i32 2, i32 3)
  %icmp = icmp eq i2 %tmp, 1
  %tmp_s = sext i32 %position_read to i64
  %node_father_addr = getelementptr [2304 x i32]* @node_father, i64 0, i64 %tmp_s
  %node_father_load = load i32* %node_father_addr, align 4
  %tmp_2 = sext i32 %node_father_load to i64
  %node_cost_addr = getelementptr [2304 x i32]* @node_cost, i64 0, i64 %tmp_2
  %node_cost_load = load i32* %node_cost_addr, align 4
  br i1 %icmp, label %2, label %1

; <label>:1                                       ; preds = %0
  %tmp_3 = add nsw i32 %node_cost_load, 10
  %node_cost_addr_1 = getelementptr [2304 x i32]* @node_cost, i64 0, i64 %tmp_s
  store i32 %tmp_3, i32* %node_cost_addr_1, align 4
  br label %3

; <label>:2                                       ; preds = %0
  %node_cost_addr_2 = getelementptr [2304 x i32]* @node_cost, i64 0, i64 %tmp_s
  %node_cost_load_1 = load i32* %node_cost_addr_2, align 4
  %tmp1 = add i32 %node_cost_load_1, 14
  %tmp_7 = add i32 %tmp1, %node_cost_load
  store i32 %tmp_7, i32* %node_cost_addr_2, align 4
  br label %3

; <label>:3                                       ; preds = %2, %1
  ret void
}

define internal fastcc void @aStar_adjacentNodes(i32 %x, i32 %y) nounwind uwtable {
  %y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %y) nounwind
  %x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %x) nounwind
  %tmp = shl i32 %y_read, 6
  %initPosition = add nsw i32 %x_read, %tmp
  %tmp_s = add nsw i32 -1, %initPosition
  store i32 %tmp_s, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 0), align 16
  %tmp_9 = add nsw i32 1, %initPosition
  store i32 %tmp_9, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 1), align 4
  %tmp_1 = add nsw i32 -64, %initPosition
  store i32 %tmp_1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 2), align 8
  %tmp_2 = add nsw i32 64, %initPosition
  store i32 %tmp_2, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 3), align 4
  %tmp_3 = add nsw i32 -65, %initPosition
  store i32 %tmp_3, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 4), align 16
  %tmp_4 = add nsw i32 -63, %initPosition
  store i32 %tmp_4, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 5), align 4
  %tmp_5 = add nsw i32 63, %initPosition
  store i32 %tmp_5, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 6), align 8
  %tmp_6 = add nsw i32 65, %initPosition
  store i32 %tmp_6, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 7), align 4
  %tmp_7 = icmp eq i32 %x_read, 0
  br i1 %tmp_7, label %1, label %2

; <label>:1                                       ; preds = %0
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 0), align 16
  store i32 1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 1), align 4
  store i32 0, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 2), align 8
  store i32 0, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 3), align 4
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 4), align 16
  store i32 1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 5), align 4
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 6), align 8
  store i32 1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 7), align 4
  br label %6

; <label>:2                                       ; preds = %0
  %tmp_8 = icmp eq i32 %x_read, 63
  br i1 %tmp_8, label %3, label %4

; <label>:3                                       ; preds = %2
  store i32 62, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 0), align 16
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 1), align 4
  store i32 63, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 2), align 8
  store i32 63, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 3), align 4
  store i32 62, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 4), align 16
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 5), align 4
  store i32 62, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 6), align 8
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 7), align 4
  br label %5

; <label>:4                                       ; preds = %2
  %tmp_10 = add nsw i32 %x_read, -1
  store i32 %tmp_10, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 0), align 16
  %tmp_11 = add nsw i32 %x_read, 1
  store i32 %tmp_11, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 1), align 4
  store i32 %x_read, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 2), align 8
  store i32 %x_read, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 3), align 4
  store i32 %tmp_10, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 4), align 16
  store i32 %tmp_11, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 5), align 4
  store i32 %tmp_10, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 6), align 8
  store i32 %tmp_11, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 7), align 4
  br label %5

; <label>:5                                       ; preds = %4, %3
  br label %6

; <label>:6                                       ; preds = %5, %1
  %tmp_12 = icmp eq i32 %y_read, 0
  br i1 %tmp_12, label %7, label %8

; <label>:7                                       ; preds = %6
  store i32 0, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 0), align 16
  store i32 0, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 1), align 4
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 2), align 8
  store i32 1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 3), align 4
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 4), align 16
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 5), align 4
  store i32 1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 6), align 8
  store i32 1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 7), align 4
  br label %12

; <label>:8                                       ; preds = %6
  %tmp_13 = icmp eq i32 %y_read, 35
  br i1 %tmp_13, label %9, label %10

; <label>:9                                       ; preds = %8
  store i32 35, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 0), align 16
  store i32 35, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 1), align 4
  store i32 34, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 2), align 8
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 3), align 4
  store i32 34, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 4), align 16
  store i32 34, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 5), align 4
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 6), align 8
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 7), align 4
  br label %11

; <label>:10                                      ; preds = %8
  store i32 %y_read, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 0), align 16
  store i32 %y_read, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 1), align 4
  %tmp_14 = add nsw i32 %y_read, -1
  store i32 %tmp_14, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 2), align 8
  %tmp_15 = add nsw i32 %y_read, 1
  store i32 %tmp_15, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 3), align 4
  store i32 %tmp_14, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 4), align 16
  store i32 %tmp_14, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 5), align 4
  store i32 %tmp_15, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 6), align 8
  store i32 %tmp_15, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 7), align 4
  br label %11

; <label>:11                                      ; preds = %10, %9
  br label %12

; <label>:12                                      ; preds = %11, %7
  ret void
}

define i32 @aStar(i32 %xStart, i32 %yStart, i32 %xFinish, i32 %yFinish, [2304 x i32]* %map_r) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %xStart) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %yStart) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %xFinish) nounwind, !map !17
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %yFinish) nounwind, !map !21
  call void (...)* @_ssdm_op_SpecBitsMap([2304 x i32]* %map_r) nounwind, !map !25
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !32
  call void (...)* @_ssdm_op_SpecTopModule([6 x i8]* @aStar_str) nounwind
  %yFinish_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %yFinish) nounwind
  %xFinish_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %xFinish) nounwind
  %yStart_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %yStart) nounwind
  %xStart_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %xStart) nounwind
  br label %1

; <label>:1                                       ; preds = %5, %0
  %y_i = phi i32 [ 0, %0 ], [ %y_1, %5 ]
  %i_i = phi i12 [ 0, %0 ], [ %i_1, %5 ]
  %x = trunc i12 %i_i to i6
  %exitcond_i = icmp eq i12 %i_i, -1792
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 2304, i64 2304, i64 2304) nounwind
  %i_1 = add i12 1, %i_i
  br i1 %exitcond_i, label %initNodes.exit, label %2

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([13 x i8]* @p_str) nounwind
  %tmp_2_i = zext i12 %i_i to i64
  %openNodes_addr = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_2_i
  store i1 true, i1* %openNodes_addr, align 1
  %tmp_4_i = icmp ne i6 %x, 0
  %tmp_5_i = icmp eq i12 %i_i, 0
  %or_cond_i = or i1 %tmp_4_i, %tmp_5_i
  %y = add nsw i32 1, %y_i
  %y_1 = select i1 %or_cond_i, i32 %y_i, i32 %y
  %tmp = trunc i32 %y_1 to i13
  %tmp_16 = call i11 @_ssdm_op_BitConcatenate.i11.i6.i5(i6 %x, i5 0)
  %p_shl_cast = zext i11 %tmp_16 to i12
  %tmp_27 = call i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6 %x, i2 0)
  %p_shl1_cast = zext i8 %tmp_27 to i12
  %tmp_28 = add i12 %p_shl_cast, %p_shl1_cast
  %tmp_34_cast = zext i12 %tmp_28 to i13
  %tmp_29 = add i13 %tmp, %tmp_34_cast
  %tmp_35_cast = sext i13 %tmp_29 to i64
  %map_addr_2 = getelementptr [2304 x i32]* %map_r, i64 0, i64 %tmp_35_cast
  %map_load = load i32* %map_addr_2, align 4
  %tmp_9_i = icmp eq i32 %map_load, 1
  br i1 %tmp_9_i, label %4, label %3

; <label>:3                                       ; preds = %2
  %node_coordinates_0_addr = getelementptr [2304 x i6]* @node_coordinates_0, i64 0, i64 %tmp_2_i
  store i6 %x, i6* %node_coordinates_0_addr, align 1
  %node_coordinates_1_addr_2 = getelementptr [2304 x i32]* @node_coordinates_1, i64 0, i64 %tmp_2_i
  store i32 %y_1, i32* %node_coordinates_1_addr_2, align 4
  %node_visited_addr_2 = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_2_i
  store i1 false, i1* %node_visited_addr_2, align 1
  br label %5

; <label>:4                                       ; preds = %2
  %node_visited_addr_1 = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_2_i
  store i1 true, i1* %node_visited_addr_1, align 1
  br label %5

; <label>:5                                       ; preds = %4, %3
  br label %1

initNodes.exit:                                   ; preds = %1
  %tmp_1 = shl i32 %yStart_read, 6
  %position_5 = add nsw i32 %xStart_read, %tmp_1
  %tmp_s = sext i32 %position_5 to i64
  %node_father_addr = getelementptr [2304 x i32]* @node_father, i64 0, i64 %tmp_s
  store i32 -1, i32* %node_father_addr, align 4
  %node_cost_addr = getelementptr [2304 x i32]* @node_cost, i64 0, i64 %tmp_s
  store i32 0, i32* %node_cost_addr, align 4
  %node_heuristic_addr = getelementptr [2304 x i32]* @node_heuristic, i64 0, i64 %tmp_s
  store i32 0, i32* %node_heuristic_addr, align 4
  %node_costPlusHeuristic_addr = getelementptr [2304 x i32]* @node_costPlusHeuristic, i64 0, i64 %tmp_s
  store i32 0, i32* %node_costPlusHeuristic_addr, align 4
  %node_visited_addr = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_s
  store i1 true, i1* %node_visited_addr, align 1
  call fastcc void @aStar_adjacentNodes(i32 %xStart_read, i32 %yStart_read)
  br label %6

; <label>:6                                       ; preds = %._crit_edge, %initNodes.exit
  %i = phi i4 [ 0, %initNodes.exit ], [ %i_2, %._crit_edge ]
  %exitcond1 = icmp eq i4 %i, -8
  %empty_4 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 8, i64 8, i64 8) nounwind
  %i_2 = add i4 %i, 1
  br i1 %exitcond1, label %.preheader2, label %7

; <label>:7                                       ; preds = %6
  call void (...)* @_ssdm_op_SpecLoopName([5 x i8]* @p_str2) nounwind
  %tmp_17 = zext i4 %i to i64
  %adjacentPosition_2_addr = getelementptr [8 x i32]* @adjacentPosition_2, i64 0, i64 %tmp_17
  %adjacentPosition_2_load = load i32* %adjacentPosition_2_addr, align 4
  %tmp_18 = sext i32 %adjacentPosition_2_load to i64
  %node_visited_addr_3 = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_18
  %node_visited_load = load i1* %node_visited_addr_3, align 1
  %tmp_19 = icmp eq i32 %adjacentPosition_2_load, -1
  %or_cond = or i1 %node_visited_load, %tmp_19
  br i1 %or_cond, label %._crit_edge, label %8

; <label>:8                                       ; preds = %7
  %openNodes_addr_3 = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_18
  store i1 false, i1* %openNodes_addr_3, align 1
  %node_father_addr_1 = getelementptr [2304 x i32]* @node_father, i64 0, i64 %tmp_18
  store i32 %position_5, i32* %node_father_addr_1, align 4
  %adjacentPosition_0_addr = getelementptr [8 x i32]* @adjacentPosition_0, i64 0, i64 %tmp_17
  %adjacentPosition_0_load = load i32* %adjacentPosition_0_addr, align 4
  %adjacentPosition_1_addr = getelementptr [8 x i32]* @adjacentPosition_1, i64 0, i64 %tmp_17
  %adjacentPosition_1_load = load i32* %adjacentPosition_1_addr, align 4
  %xDistance = sub nsw i32 %xFinish_read, %adjacentPosition_0_load
  %yDistance = sub nsw i32 %yFinish_read, %adjacentPosition_1_load
  %neg_i = sub i32 0, %xDistance
  %abscond_i = icmp sgt i32 %xDistance, 0
  %abs_i = select i1 %abscond_i, i32 %xDistance, i32 %neg_i
  %neg1_i = sub i32 0, %yDistance
  %abscond2_i = icmp sgt i32 %yDistance, 0
  %abs3_i = select i1 %abscond2_i, i32 %yDistance, i32 %neg1_i
  %tmp_i1 = add nsw i32 %abs3_i, %abs_i
  %node_heuristic_addr_1 = getelementptr [2304 x i32]* @node_heuristic, i64 0, i64 %tmp_18
  store i32 %tmp_i1, i32* %node_heuristic_addr_1, align 4
  call fastcc void @aStar_calculateCost(i4 %i, i32 %adjacentPosition_2_load) nounwind
  %node_cost_addr_3 = getelementptr [2304 x i32]* @node_cost, i64 0, i64 %tmp_18
  %node_cost_load = load i32* %node_cost_addr_3, align 4
  %tmp_3 = shl i32 %tmp_i1, 3
  %tmp_4 = shl i32 %tmp_i1, 1
  %tmp1 = add i32 %tmp_3, %tmp_4
  %tmp_1_i = add nsw i32 %tmp1, %node_cost_load
  %node_costPlusHeuristic_addr_1 = getelementptr [2304 x i32]* @node_costPlusHeuristic, i64 0, i64 %tmp_18
  store i32 %tmp_1_i, i32* %node_costPlusHeuristic_addr_1, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %7
  br label %6

.preheader2:                                      ; preds = %6, %_ifconv.i
  %positionBestOption = phi i12 [ %i_4, %_ifconv.i ], [ 0, %6 ]
  %position_3 = phi i32 [ %positionBestOption_2_i, %_ifconv.i ], [ undef, %6 ]
  %bestOption_i = phi i32 [ %bestOption_2_i, %_ifconv.i ], [ 2147483647, %6 ]
  %positionBestOption_i_cast = zext i12 %positionBestOption to i32
  %exitcond_i1 = icmp eq i12 %positionBestOption, -1792
  %empty_5 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 2304, i64 2304, i64 2304) nounwind
  %i_4 = add i12 %positionBestOption, 1
  br i1 %exitcond_i1, label %calculateBestOption.exit, label %_ifconv.i

_ifconv.i:                                        ; preds = %.preheader2
  call void (...)* @_ssdm_op_SpecLoopName([23 x i8]* @p_str1) nounwind
  %tmp_i7 = zext i12 %positionBestOption to i64
  %openNodes_addr_2 = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_i7
  %openNodes_load = load i1* %openNodes_addr_2, align 1
  %node_costPlusHeuristic_addr_3 = getelementptr [2304 x i32]* @node_costPlusHeuristic, i64 0, i64 %tmp_i7
  %bestOption = load i32* %node_costPlusHeuristic_addr_3, align 4
  %tmp_8_i9 = icmp slt i32 %bestOption, %bestOption_i
  %positionBestOption_positionBes = select i1 %tmp_8_i9, i32 %positionBestOption_i_cast, i32 %position_3
  %bestOption_1_bestOption_i = select i1 %tmp_8_i9, i32 %bestOption, i32 %bestOption_i
  %positionBestOption_2_i = select i1 %openNodes_load, i32 %position_3, i32 %positionBestOption_positionBes
  %bestOption_2_i = select i1 %openNodes_load, i32 %bestOption_i, i32 %bestOption_1_bestOption_i
  br label %.preheader2

calculateBestOption.exit:                         ; preds = %.preheader2
  %tmp_i = sext i32 %position_3 to i64
  %openNodes_addr_1 = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_i
  store i1 true, i1* %openNodes_addr_1, align 1
  %node_visited_addr_4 = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_i
  store i1 true, i1* %node_visited_addr_4, align 1
  %tmp_2 = shl i32 %yFinish_read, 6
  %finalPosition = add nsw i32 %xFinish_read, %tmp_2
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %calculateBestOption.exit28, %calculateBestOption.exit
  %position3 = phi i32 [ %position_3, %calculateBestOption.exit ], [ %position_4, %calculateBestOption.exit28 ]
  %tmp_20 = sext i32 %position3 to i64
  %node_coordinates_0_addr_1 = getelementptr [2304 x i6]* @node_coordinates_0, i64 0, i64 %tmp_20
  %node_coordinates_0_load = load i6* %node_coordinates_0_addr_1, align 1
  %extLd = zext i6 %node_coordinates_0_load to i32
  %node_coordinates_1_addr = getelementptr [2304 x i32]* @node_coordinates_1, i64 0, i64 %tmp_20
  %node_coordinates_1_load = load i32* %node_coordinates_1_addr, align 4
  call fastcc void @aStar_adjacentNodes(i32 %extLd, i32 %node_coordinates_1_load)
  br label %9

; <label>:9                                       ; preds = %._crit_edge3, %._crit_edge5
  %i1 = phi i4 [ 0, %._crit_edge5 ], [ %i_3, %._crit_edge3 ]
  %exitcond = icmp eq i4 %i1, -8
  %empty_6 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 8, i64 8, i64 8) nounwind
  %i_3 = add i4 %i1, 1
  br i1 %exitcond, label %.preheader1, label %10

; <label>:10                                      ; preds = %9
  call void (...)* @_ssdm_op_SpecLoopName([5 x i8]* @p_str3) nounwind
  %tmp_21 = zext i4 %i1 to i64
  %adjacentPosition_2_addr_1 = getelementptr [8 x i32]* @adjacentPosition_2, i64 0, i64 %tmp_21
  %adjacentPosition_2_load_1 = load i32* %adjacentPosition_2_addr_1, align 4
  %tmp_23 = sext i32 %adjacentPosition_2_load_1 to i64
  %node_visited_addr_5 = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_23
  %node_visited_load_1 = load i1* %node_visited_addr_5, align 1
  %tmp_24 = icmp eq i32 %adjacentPosition_2_load_1, -1
  %or_cond1 = or i1 %node_visited_load_1, %tmp_24
  br i1 %or_cond1, label %._crit_edge3, label %11

; <label>:11                                      ; preds = %10
  %openNodes_addr_6 = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_23
  store i1 false, i1* %openNodes_addr_6, align 1
  %node_coordinates_0_load_1 = load i6* %node_coordinates_0_addr_1, align 1
  %node_coordinates_1_load_2 = load i32* %node_coordinates_1_addr, align 4
  %tmp_5 = trunc i32 %node_coordinates_1_load_2 to i26
  %positionFather_1 = call i32 @_ssdm_op_BitConcatenate.i32.i26.i6(i26 %tmp_5, i6 %node_coordinates_0_load_1)
  %node_father_addr_3 = getelementptr [2304 x i32]* @node_father, i64 0, i64 %tmp_23
  store i32 %positionFather_1, i32* %node_father_addr_3, align 4
  %adjacentPosition_0_addr_1 = getelementptr [8 x i32]* @adjacentPosition_0, i64 0, i64 %tmp_21
  %adjacentPosition_0_load_1 = load i32* %adjacentPosition_0_addr_1, align 4
  %adjacentPosition_1_addr_1 = getelementptr [8 x i32]* @adjacentPosition_1, i64 0, i64 %tmp_21
  %adjacentPosition_1_load_1 = load i32* %adjacentPosition_1_addr_1, align 4
  %xDistance_1 = sub nsw i32 %xFinish_read, %adjacentPosition_0_load_1
  %yDistance_1 = sub nsw i32 %yFinish_read, %adjacentPosition_1_load_1
  %neg_i1 = sub i32 0, %xDistance_1
  %abscond_i1 = icmp sgt i32 %xDistance_1, 0
  %abs_i1 = select i1 %abscond_i1, i32 %xDistance_1, i32 %neg_i1
  %neg1_i1 = sub i32 0, %yDistance_1
  %abscond2_i1 = icmp sgt i32 %yDistance_1, 0
  %abs3_i1 = select i1 %abscond2_i1, i32 %yDistance_1, i32 %neg1_i1
  %tmp_i5 = add nsw i32 %abs_i1, %abs3_i1
  %node_heuristic_addr_2 = getelementptr [2304 x i32]* @node_heuristic, i64 0, i64 %tmp_23
  store i32 %tmp_i5, i32* %node_heuristic_addr_2, align 4
  call fastcc void @aStar_calculateCost(i4 %i1, i32 %adjacentPosition_2_load_1) nounwind
  %node_cost_addr_4 = getelementptr [2304 x i32]* @node_cost, i64 0, i64 %tmp_23
  %node_cost_load_2 = load i32* %node_cost_addr_4, align 4
  %tmp_6 = shl i32 %tmp_i5, 3
  %tmp_7 = shl i32 %tmp_i5, 1
  %tmp2 = add i32 %tmp_7, %tmp_6
  %tmp_1_i1 = add nsw i32 %node_cost_load_2, %tmp2
  %node_costPlusHeuristic_addr_2 = getelementptr [2304 x i32]* @node_costPlusHeuristic, i64 0, i64 %tmp_23
  store i32 %tmp_1_i1, i32* %node_costPlusHeuristic_addr_2, align 4
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %11, %10
  br label %9

.preheader1:                                      ; preds = %9, %_ifconv.i27
  %positionBestOption_1 = phi i12 [ %i_5, %_ifconv.i27 ], [ 0, %9 ]
  %position_4 = phi i32 [ %positionBestOption_2_i1, %_ifconv.i27 ], [ undef, %9 ]
  %bestOption_i1 = phi i32 [ %bestOption_2_i1, %_ifconv.i27 ], [ 2147483647, %9 ]
  %positionBestOption_i11_cast = zext i12 %positionBestOption_1 to i32
  %exitcond_i2 = icmp eq i12 %positionBestOption_1, -1792
  %empty_7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 2304, i64 2304, i64 2304) nounwind
  %i_5 = add i12 %positionBestOption_1, 1
  br i1 %exitcond_i2, label %calculateBestOption.exit28, label %_ifconv.i27

_ifconv.i27:                                      ; preds = %.preheader1
  call void (...)* @_ssdm_op_SpecLoopName([23 x i8]* @p_str1) nounwind
  %tmp_i8 = zext i12 %positionBestOption_1 to i64
  %openNodes_addr_5 = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_i8
  %openNodes_load_1 = load i1* %openNodes_addr_5, align 1
  %node_costPlusHeuristic_addr_4 = getelementptr [2304 x i32]* @node_costPlusHeuristic, i64 0, i64 %tmp_i8
  %bestOption_1 = load i32* %node_costPlusHeuristic_addr_4, align 4
  %tmp_8_i1 = icmp slt i32 %bestOption_1, %bestOption_i1
  %positionBestOption_positionBes_1 = select i1 %tmp_8_i1, i32 %positionBestOption_i11_cast, i32 %position_4
  %bestOption_1_bestOption_i1 = select i1 %tmp_8_i1, i32 %bestOption_1, i32 %bestOption_i1
  %positionBestOption_2_i1 = select i1 %openNodes_load_1, i32 %position_4, i32 %positionBestOption_positionBes_1
  %bestOption_2_i1 = select i1 %openNodes_load_1, i32 %bestOption_i1, i32 %bestOption_1_bestOption_i1
  br label %.preheader1

calculateBestOption.exit28:                       ; preds = %.preheader1
  %tmp_i3 = sext i32 %position_4 to i64
  %openNodes_addr_4 = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_i3
  store i1 true, i1* %openNodes_addr_4, align 1
  %node_visited_addr_6 = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_i3
  store i1 true, i1* %node_visited_addr_6, align 1
  %tmp_22 = icmp eq i32 %position_4, %finalPosition
  br i1 %tmp_22, label %.preheader, label %._crit_edge5

.preheader:                                       ; preds = %calculateBestOption.exit28, %12
  %position_1 = phi i32 [ %position, %12 ], [ %finalPosition, %calculateBestOption.exit28 ]
  %tmp_25 = sext i32 %position_1 to i64
  %node_father_addr_2 = getelementptr [2304 x i32]* @node_father, i64 0, i64 %tmp_25
  %position = load i32* %node_father_addr_2, align 4
  %tmp_26 = icmp eq i32 %position, -1
  br i1 %tmp_26, label %13, label %12

; <label>:12                                      ; preds = %.preheader
  %node_coordinates_1_addr_1 = getelementptr [2304 x i32]* @node_coordinates_1, i64 0, i64 %tmp_25
  %node_coordinates_1_load_1 = load i32* %node_coordinates_1_addr_1, align 4
  %tmp_11 = trunc i32 %node_coordinates_1_load_1 to i13
  %node_coordinates_0_addr_2 = getelementptr [2304 x i6]* @node_coordinates_0, i64 0, i64 %tmp_25
  %node_coordinates_0_load_2 = load i6* %node_coordinates_0_addr_2, align 1
  %tmp_12 = call i11 @_ssdm_op_BitConcatenate.i11.i6.i5(i6 %node_coordinates_0_load_2, i5 0)
  %p_shl2_cast = zext i11 %tmp_12 to i13
  %tmp_13 = call i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6 %node_coordinates_0_load_2, i2 0)
  %p_shl3_cast = zext i8 %tmp_13 to i13
  %tmp_32 = add i13 %p_shl3_cast, %p_shl2_cast
  %tmp_33 = add i13 %tmp_32, %tmp_11
  %tmp_49_cast = sext i13 %tmp_33 to i64
  %map_addr_1 = getelementptr [2304 x i32]* %map_r, i64 0, i64 %tmp_49_cast
  store i32 2, i32* %map_addr_1, align 4
  br label %.preheader

; <label>:13                                      ; preds = %.preheader
  %tmp_8 = trunc i32 %yFinish_read to i13
  %tmp_9 = trunc i32 %xFinish_read to i8
  %p_shl4_cast = call i13 @_ssdm_op_BitConcatenate.i13.i8.i5(i8 %tmp_9, i5 0)
  %tmp_10 = trunc i32 %xFinish_read to i11
  %p_shl5_cast = call i13 @_ssdm_op_BitConcatenate.i13.i11.i2(i11 %tmp_10, i2 0)
  %tmp_30 = add i13 %p_shl4_cast, %p_shl5_cast
  %tmp_31 = add i13 %tmp_8, %tmp_30
  %tmp_45_cast = sext i13 %tmp_31 to i64
  %map_addr = getelementptr [2304 x i32]* %map_r, i64 0, i64 %tmp_45_cast
  store i32 4, i32* %map_addr, align 4
  ret i32 0
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i4 @_ssdm_op_Read.ap_auto.i4(i4) {
entry:
  ret i4 %0
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

declare i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i6 @_ssdm_op_PartSelect.i6.i12.i32.i32(i12, i32, i32) nounwind readnone

declare i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i29 @_ssdm_op_PartSelect.i29.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i2 @_ssdm_op_PartSelect.i2.i4.i32.i32(i4, i32, i32) nounwind readnone {
entry:
  %empty = call i4 @llvm.part.select.i4(i4 %0, i32 %1, i32 %2)
  %empty_8 = trunc i4 %empty to i2
  ret i2 %empty_8
}

declare i13 @_ssdm_op_PartSelect.i13.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i11 @_ssdm_op_PartSelect.i11.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i16 @_ssdm_op_HSub(...)

declare i16 @_ssdm_op_HMul(...)

declare i16 @_ssdm_op_HDiv(...)

declare i16 @_ssdm_op_HAdd(...)

define weak i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6, i2) nounwind readnone {
entry:
  %empty = zext i6 %0 to i8
  %empty_9 = zext i2 %1 to i8
  %empty_10 = shl i8 %empty, 2
  %empty_11 = or i8 %empty_10, %empty_9
  ret i8 %empty_11
}

declare i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31, i1) nounwind readnone

declare i32 @_ssdm_op_BitConcatenate.i32.i29.i3(i29, i3) nounwind readnone

define weak i32 @_ssdm_op_BitConcatenate.i32.i26.i6(i26, i6) nounwind readnone {
entry:
  %empty = zext i26 %0 to i32
  %empty_12 = zext i6 %1 to i32
  %empty_13 = shl i32 %empty, 6
  %empty_14 = or i32 %empty_13, %empty_12
  ret i32 %empty_14
}

define weak i13 @_ssdm_op_BitConcatenate.i13.i8.i5(i8, i5) nounwind readnone {
entry:
  %empty = zext i8 %0 to i13
  %empty_15 = zext i5 %1 to i13
  %empty_16 = shl i13 %empty, 5
  %empty_17 = or i13 %empty_16, %empty_15
  ret i13 %empty_17
}

define weak i13 @_ssdm_op_BitConcatenate.i13.i11.i2(i11, i2) nounwind readnone {
entry:
  %empty = zext i11 %0 to i13
  %empty_18 = zext i2 %1 to i13
  %empty_19 = shl i13 %empty, 2
  %empty_20 = or i13 %empty_19, %empty_18
  ret i13 %empty_20
}

define weak i11 @_ssdm_op_BitConcatenate.i11.i6.i5(i6, i5) nounwind readnone {
entry:
  %empty = zext i6 %0 to i11
  %empty_21 = zext i5 %1 to i11
  %empty_22 = shl i11 %empty, 5
  %empty_23 = or i11 %empty_22, %empty_21
  ret i11 %empty_23
}

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!hls.encrypted.func = !{}
!llvm.map.gv = !{!0}

!0 = metadata !{metadata !1, [1 x i32]* @llvm_global_ctors_0}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !"", i32 0, i32 31}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 0, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 31, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"xStart", metadata !11, metadata !"int", i32 0, i32 31}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 0, i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 31, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"yStart", metadata !11, metadata !"int", i32 0, i32 31}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 31, metadata !19}
!19 = metadata !{metadata !20}
!20 = metadata !{metadata !"xFinish", metadata !11, metadata !"int", i32 0, i32 31}
!21 = metadata !{metadata !22}
!22 = metadata !{i32 0, i32 31, metadata !23}
!23 = metadata !{metadata !24}
!24 = metadata !{metadata !"yFinish", metadata !11, metadata !"int", i32 0, i32 31}
!25 = metadata !{metadata !26}
!26 = metadata !{i32 0, i32 31, metadata !27}
!27 = metadata !{metadata !28}
!28 = metadata !{metadata !"map", metadata !29, metadata !"int", i32 0, i32 31}
!29 = metadata !{metadata !30, metadata !31}
!30 = metadata !{i32 0, i32 63, i32 1}
!31 = metadata !{i32 0, i32 35, i32 1}
!32 = metadata !{metadata !33}
!33 = metadata !{i32 0, i32 31, metadata !34}
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !"return", metadata !36, metadata !"int", i32 0, i32 31}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 0, i32 1, i32 0}
