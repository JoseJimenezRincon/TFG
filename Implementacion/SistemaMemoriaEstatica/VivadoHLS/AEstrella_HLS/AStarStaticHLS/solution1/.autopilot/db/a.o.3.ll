; ModuleID = '/home/jose/tfg.jose.jimenez/VivadoHLS/AStarStatic/AStarStaticHLS/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@openNodes = internal unnamed_addr global [2304 x i1] zeroinitializer ; [#uses=7 type=[2304 x i1]*]
@node_visited = internal unnamed_addr global [2304 x i1] zeroinitializer ; [#uses=7 type=[2304 x i1]*]
@node_heuristic = internal unnamed_addr global [2304 x i32] zeroinitializer ; [#uses=3 type=[2304 x i32]*]
@node_father = internal unnamed_addr global [2304 x i32] zeroinitializer ; [#uses=5 type=[2304 x i32]*]
@node_costPlusHeuristic = internal unnamed_addr global [2304 x i32] zeroinitializer ; [#uses=5 type=[2304 x i32]*]
@node_cost = internal unnamed_addr global [2304 x i32] zeroinitializer ; [#uses=6 type=[2304 x i32]*]
@node_coordinates_1 = internal unnamed_addr global [2304 x i32] zeroinitializer ; [#uses=3 type=[2304 x i32]*]
@node_coordinates_0 = internal global [2304 x i6] zeroinitializer ; [#uses=3 type=[2304 x i6]*]
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a] ; [#uses=0 type=[1 x void ()*]*]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535] ; [#uses=0 type=[1 x i32]*]
@adjacentPosition_2 = internal unnamed_addr global [8 x i32] zeroinitializer ; [#uses=10 type=[8 x i32]*]
@adjacentPosition_1 = internal unnamed_addr global [8 x i32] zeroinitializer ; [#uses=10 type=[8 x i32]*]
@adjacentPosition_0 = internal unnamed_addr global [8 x i32] zeroinitializer ; [#uses=10 type=[8 x i32]*]
@aStar_str = internal unnamed_addr constant [6 x i8] c"aStar\00" ; [#uses=1 type=[6 x i8]*]
@p_str3 = private unnamed_addr constant [5 x i8] c"FOR2\00", align 1 ; [#uses=1 type=[5 x i8]*]
@p_str2 = private unnamed_addr constant [5 x i8] c"FOR1\00", align 1 ; [#uses=1 type=[5 x i8]*]
@p_str1 = private unnamed_addr constant [23 x i8] c"FORcalculateBestOption\00", align 1 ; [#uses=2 type=[23 x i8]*]
@p_str = private unnamed_addr constant [13 x i8] c"ForinitNodes\00", align 1 ; [#uses=1 type=[13 x i8]*]

; [#uses=1]
declare i4 @llvm.part.select.i4(i4, i32, i32) nounwind readnone

; [#uses=69]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=2]
define internal fastcc void @aStar_calculateCost(i4 %i, i32 %position) {
  %position_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %position) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %position_read}, i64 0, metadata !7), !dbg !15 ; [debug line = 196:31] [debug variable = position]
  %i_read = call i4 @_ssdm_op_Read.ap_auto.i4(i4 %i) ; [#uses=1 type=i4]
  call void @llvm.dbg.value(metadata !{i4 %i_read}, i64 0, metadata !16), !dbg !17 ; [debug line = 196:24] [debug variable = i]
  call void @llvm.dbg.value(metadata !{i4 %i}, i64 0, metadata !16), !dbg !17 ; [debug line = 196:24] [debug variable = i]
  call void @llvm.dbg.value(metadata !{i32 %position}, i64 0, metadata !7), !dbg !15 ; [debug line = 196:31] [debug variable = position]
  %tmp = call i2 @_ssdm_op_PartSelect.i2.i4.i32.i32(i4 %i_read, i32 2, i32 3), !dbg !18 ; [#uses=1 type=i2] [debug line = 197:2]
  %icmp = icmp eq i2 %tmp, 1, !dbg !18            ; [#uses=1 type=i1] [debug line = 197:2]
  %tmp_s = sext i32 %position_read to i64, !dbg !20 ; [#uses=3 type=i64] [debug line = 198:3]
  %node_father_addr = getelementptr [2304 x i32]* @node_father, i64 0, i64 %tmp_s, !dbg !20 ; [#uses=1 type=i32*] [debug line = 198:3]
  %node_father_load = load i32* %node_father_addr, align 4, !dbg !20 ; [#uses=1 type=i32] [debug line = 198:3]
  %tmp_2 = sext i32 %node_father_load to i64, !dbg !20 ; [#uses=1 type=i64] [debug line = 198:3]
  %node_cost_addr = getelementptr [2304 x i32]* @node_cost, i64 0, i64 %tmp_2, !dbg !20 ; [#uses=1 type=i32*] [debug line = 198:3]
  %node_cost_load = load i32* %node_cost_addr, align 4, !dbg !20 ; [#uses=2 type=i32] [debug line = 198:3]
  br i1 %icmp, label %2, label %1, !dbg !18       ; [debug line = 197:2]

; <label>:1                                       ; preds = %0
  %tmp_3 = add nsw i32 %node_cost_load, 10, !dbg !20 ; [#uses=1 type=i32] [debug line = 198:3]
  %node_cost_addr_1 = getelementptr [2304 x i32]* @node_cost, i64 0, i64 %tmp_s, !dbg !20 ; [#uses=1 type=i32*] [debug line = 198:3]
  store i32 %tmp_3, i32* %node_cost_addr_1, align 4, !dbg !20 ; [debug line = 198:3]
  br label %3, !dbg !22                           ; [debug line = 199:2]

; <label>:2                                       ; preds = %0
  %node_cost_addr_2 = getelementptr [2304 x i32]* @node_cost, i64 0, i64 %tmp_s, !dbg !23 ; [#uses=2 type=i32*] [debug line = 200:3]
  %node_cost_load_1 = load i32* %node_cost_addr_2, align 4, !dbg !23 ; [#uses=1 type=i32] [debug line = 200:3]
  %tmp1 = add i32 %node_cost_load_1, 14, !dbg !23 ; [#uses=1 type=i32] [debug line = 200:3]
  %tmp_7 = add i32 %tmp1, %node_cost_load, !dbg !23 ; [#uses=1 type=i32] [debug line = 200:3]
  store i32 %tmp_7, i32* %node_cost_addr_2, align 4, !dbg !23 ; [debug line = 200:3]
  br label %3

; <label>:3                                       ; preds = %2, %1
  ret void, !dbg !25                              ; [debug line = 202:1]
}

; [#uses=2]
define internal fastcc void @aStar_adjacentNodes(i32 %x, i32 %y) nounwind uwtable {
  %y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %y) nounwind ; [#uses=7 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %y_read}, i64 0, metadata !26), !dbg !28 ; [debug line = 44:31] [debug variable = y]
  %x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %x) nounwind ; [#uses=7 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %x_read}, i64 0, metadata !29), !dbg !30 ; [debug line = 44:24] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !29), !dbg !30 ; [debug line = 44:24] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !26), !dbg !28 ; [debug line = 44:31] [debug variable = y]
  %tmp = shl i32 %y_read, 6, !dbg !31             ; [#uses=1 type=i32] [debug line = 45:29]
  %initPosition = add nsw i32 %x_read, %tmp, !dbg !31 ; [#uses=8 type=i32] [debug line = 45:29]
  call void @llvm.dbg.value(metadata !{i32 %initPosition}, i64 0, metadata !33), !dbg !31 ; [debug line = 45:29] [debug variable = initPosition]
  %tmp_s = add nsw i32 -1, %initPosition, !dbg !34 ; [#uses=1 type=i32] [debug line = 47:2]
  store i32 %tmp_s, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 0), align 16, !dbg !34 ; [debug line = 47:2]
  %tmp_9 = add nsw i32 1, %initPosition, !dbg !35 ; [#uses=1 type=i32] [debug line = 49:2]
  store i32 %tmp_9, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 1), align 4, !dbg !35 ; [debug line = 49:2]
  %tmp_1 = add nsw i32 -64, %initPosition, !dbg !36 ; [#uses=1 type=i32] [debug line = 51:2]
  store i32 %tmp_1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 2), align 8, !dbg !36 ; [debug line = 51:2]
  %tmp_2 = add nsw i32 64, %initPosition, !dbg !37 ; [#uses=1 type=i32] [debug line = 53:2]
  store i32 %tmp_2, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 3), align 4, !dbg !37 ; [debug line = 53:2]
  %tmp_3 = add nsw i32 -65, %initPosition, !dbg !38 ; [#uses=1 type=i32] [debug line = 55:2]
  store i32 %tmp_3, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 4), align 16, !dbg !38 ; [debug line = 55:2]
  %tmp_4 = add nsw i32 -63, %initPosition, !dbg !39 ; [#uses=1 type=i32] [debug line = 57:2]
  store i32 %tmp_4, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 5), align 4, !dbg !39 ; [debug line = 57:2]
  %tmp_5 = add nsw i32 63, %initPosition, !dbg !40 ; [#uses=1 type=i32] [debug line = 59:2]
  store i32 %tmp_5, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 6), align 8, !dbg !40 ; [debug line = 59:2]
  %tmp_6 = add nsw i32 65, %initPosition, !dbg !41 ; [#uses=1 type=i32] [debug line = 61:2]
  store i32 %tmp_6, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 7), align 4, !dbg !41 ; [debug line = 61:2]
  %tmp_7 = icmp eq i32 %x_read, 0, !dbg !42       ; [#uses=1 type=i1] [debug line = 64:2]
  br i1 %tmp_7, label %1, label %2, !dbg !42      ; [debug line = 64:2]

; <label>:1                                       ; preds = %0
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 0), align 16, !dbg !43 ; [debug line = 66:3]
  store i32 1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 1), align 4, !dbg !45 ; [debug line = 68:3]
  store i32 0, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 2), align 8, !dbg !46 ; [debug line = 70:3]
  store i32 0, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 3), align 4, !dbg !47 ; [debug line = 72:3]
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 4), align 16, !dbg !48 ; [debug line = 74:3]
  store i32 1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 5), align 4, !dbg !49 ; [debug line = 76:3]
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 6), align 8, !dbg !50 ; [debug line = 78:3]
  store i32 1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 7), align 4, !dbg !51 ; [debug line = 80:3]
  br label %6, !dbg !52                           ; [debug line = 81:2]

; <label>:2                                       ; preds = %0
  %tmp_8 = icmp eq i32 %x_read, 63, !dbg !53      ; [#uses=1 type=i1] [debug line = 81:8]
  br i1 %tmp_8, label %3, label %4, !dbg !53      ; [debug line = 81:8]

; <label>:3                                       ; preds = %2
  store i32 62, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 0), align 16, !dbg !54 ; [debug line = 83:3]
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 1), align 4, !dbg !56 ; [debug line = 85:3]
  store i32 63, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 2), align 8, !dbg !57 ; [debug line = 87:3]
  store i32 63, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 3), align 4, !dbg !58 ; [debug line = 89:3]
  store i32 62, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 4), align 16, !dbg !59 ; [debug line = 91:3]
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 5), align 4, !dbg !60 ; [debug line = 93:3]
  store i32 62, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 6), align 8, !dbg !61 ; [debug line = 95:3]
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 7), align 4, !dbg !62 ; [debug line = 97:3]
  br label %5, !dbg !63                           ; [debug line = 98:2]

; <label>:4                                       ; preds = %2
  %tmp_10 = add nsw i32 %x_read, -1, !dbg !64     ; [#uses=3 type=i32] [debug line = 100:3]
  store i32 %tmp_10, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 0), align 16, !dbg !64 ; [debug line = 100:3]
  %tmp_11 = add nsw i32 %x_read, 1, !dbg !66      ; [#uses=3 type=i32] [debug line = 102:3]
  store i32 %tmp_11, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 1), align 4, !dbg !66 ; [debug line = 102:3]
  store i32 %x_read, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 2), align 8, !dbg !67 ; [debug line = 104:3]
  store i32 %x_read, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 3), align 4, !dbg !68 ; [debug line = 106:3]
  store i32 %tmp_10, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 4), align 16, !dbg !69 ; [debug line = 108:3]
  store i32 %tmp_11, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 5), align 4, !dbg !70 ; [debug line = 110:3]
  store i32 %tmp_10, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 6), align 8, !dbg !71 ; [debug line = 112:3]
  store i32 %tmp_11, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_0, i64 0, i64 7), align 4, !dbg !72 ; [debug line = 114:3]
  br label %5

; <label>:5                                       ; preds = %4, %3
  br label %6

; <label>:6                                       ; preds = %5, %1
  %tmp_12 = icmp eq i32 %y_read, 0, !dbg !73      ; [#uses=1 type=i1] [debug line = 117:2]
  br i1 %tmp_12, label %7, label %8, !dbg !73     ; [debug line = 117:2]

; <label>:7                                       ; preds = %6
  store i32 0, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 0), align 16, !dbg !74 ; [debug line = 119:3]
  store i32 0, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 1), align 4, !dbg !76 ; [debug line = 121:3]
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 2), align 8, !dbg !77 ; [debug line = 123:3]
  store i32 1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 3), align 4, !dbg !78 ; [debug line = 125:3]
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 4), align 16, !dbg !79 ; [debug line = 127:3]
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 5), align 4, !dbg !80 ; [debug line = 129:3]
  store i32 1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 6), align 8, !dbg !81 ; [debug line = 131:3]
  store i32 1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 7), align 4, !dbg !82 ; [debug line = 133:3]
  br label %12, !dbg !83                          ; [debug line = 134:2]

; <label>:8                                       ; preds = %6
  %tmp_13 = icmp eq i32 %y_read, 35, !dbg !84     ; [#uses=1 type=i1] [debug line = 134:8]
  br i1 %tmp_13, label %9, label %10, !dbg !84    ; [debug line = 134:8]

; <label>:9                                       ; preds = %8
  store i32 35, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 0), align 16, !dbg !85 ; [debug line = 136:3]
  store i32 35, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 1), align 4, !dbg !87 ; [debug line = 138:3]
  store i32 34, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 2), align 8, !dbg !88 ; [debug line = 140:3]
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 3), align 4, !dbg !89 ; [debug line = 142:3]
  store i32 34, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 4), align 16, !dbg !90 ; [debug line = 144:3]
  store i32 34, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 5), align 4, !dbg !91 ; [debug line = 146:3]
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 6), align 8, !dbg !92 ; [debug line = 148:3]
  store i32 -1, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_2, i64 0, i64 7), align 4, !dbg !93 ; [debug line = 150:3]
  br label %11, !dbg !94                          ; [debug line = 151:2]

; <label>:10                                      ; preds = %8
  store i32 %y_read, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 0), align 16, !dbg !95 ; [debug line = 153:3]
  store i32 %y_read, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 1), align 4, !dbg !97 ; [debug line = 155:3]
  %tmp_14 = add nsw i32 %y_read, -1, !dbg !98     ; [#uses=3 type=i32] [debug line = 157:3]
  store i32 %tmp_14, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 2), align 8, !dbg !98 ; [debug line = 157:3]
  %tmp_15 = add nsw i32 %y_read, 1, !dbg !99      ; [#uses=3 type=i32] [debug line = 159:3]
  store i32 %tmp_15, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 3), align 4, !dbg !99 ; [debug line = 159:3]
  store i32 %tmp_14, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 4), align 16, !dbg !100 ; [debug line = 161:3]
  store i32 %tmp_14, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 5), align 4, !dbg !101 ; [debug line = 163:3]
  store i32 %tmp_15, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 6), align 8, !dbg !102 ; [debug line = 165:3]
  store i32 %tmp_15, i32* getelementptr inbounds ([8 x i32]* @adjacentPosition_1, i64 0, i64 7), align 4, !dbg !103 ; [debug line = 167:3]
  br label %11

; <label>:11                                      ; preds = %10, %9
  br label %12

; <label>:12                                      ; preds = %11, %7
  ret void, !dbg !104                             ; [debug line = 170:1]
}

; [#uses=0]
define i32 @aStar(i32 %xStart, i32 %yStart, i32 %xFinish, i32 %yFinish, [2304 x i32]* %map) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %xStart) nounwind, !map !105
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %yStart) nounwind, !map !111
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %xFinish) nounwind, !map !115
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %yFinish) nounwind, !map !119
  call void (...)* @_ssdm_op_SpecBitsMap([2304 x i32]* %map) nounwind, !map !123
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !130
  call void (...)* @_ssdm_op_SpecTopModule([6 x i8]* @aStar_str) nounwind
  %yFinish_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %yFinish) nounwind ; [#uses=4 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %yFinish_read}, i64 0, metadata !136), !dbg !144 ; [debug line = 208:52] [debug variable = yFinish]
  call void @llvm.dbg.value(metadata !{i32 %yFinish_read}, i64 0, metadata !145), !dbg !154 ; [debug line = 188:70@229:4] [debug variable = yFinish]
  call void @llvm.dbg.value(metadata !{i32 %yFinish_read}, i64 0, metadata !155), !dbg !161 ; [debug line = 188:70@250:5] [debug variable = yFinish]
  %xFinish_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %xFinish) nounwind ; [#uses=5 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %xFinish_read}, i64 0, metadata !162), !dbg !163 ; [debug line = 208:39] [debug variable = xFinish]
  call void @llvm.dbg.value(metadata !{i32 %xFinish_read}, i64 0, metadata !164), !dbg !165 ; [debug line = 188:57@229:4] [debug variable = xFinish]
  call void @llvm.dbg.value(metadata !{i32 %xFinish_read}, i64 0, metadata !166), !dbg !167 ; [debug line = 188:57@250:5] [debug variable = xFinish]
  %yStart_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %yStart) nounwind ; [#uses=2 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %yStart_read}, i64 0, metadata !168), !dbg !169 ; [debug line = 208:27] [debug variable = yStart]
  call void @llvm.dbg.value(metadata !{i32 %yStart_read}, i64 0, metadata !170), !dbg !175 ; [debug line = 30:53@228:4] [debug variable = yFather]
  %xStart_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %xStart) nounwind ; [#uses=2 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %xStart_read}, i64 0, metadata !176), !dbg !177 ; [debug line = 208:15] [debug variable = xStart]
  call void @llvm.dbg.value(metadata !{i32 %xStart_read}, i64 0, metadata !178), !dbg !179 ; [debug line = 30:40@228:4] [debug variable = xFather]
  call void @llvm.dbg.value(metadata !{i32 %xStart}, i64 0, metadata !176), !dbg !177 ; [debug line = 208:15] [debug variable = xStart]
  call void @llvm.dbg.value(metadata !{i32 %yStart}, i64 0, metadata !168), !dbg !169 ; [debug line = 208:27] [debug variable = yStart]
  call void @llvm.dbg.value(metadata !{i32 %xFinish}, i64 0, metadata !162), !dbg !163 ; [debug line = 208:39] [debug variable = xFinish]
  call void @llvm.dbg.value(metadata !{i32 %yFinish}, i64 0, metadata !136), !dbg !144 ; [debug line = 208:52] [debug variable = yFinish]
  call void @llvm.dbg.value(metadata !{[2304 x i32]* %map}, i64 0, metadata !180), !dbg !184 ; [debug line = 208:65] [debug variable = map]
  call void @llvm.dbg.value(metadata !{[2304 x i32]* %map}, i64 0, metadata !185) nounwind, !dbg !190 ; [debug line = 9:50@211:2] [debug variable = map]
  br label %1, !dbg !191                          ; [debug line = 14:29@211:2]

; <label>:1                                       ; preds = %5, %0
  %y_i = phi i32 [ 0, %0 ], [ %y_1, %5 ]          ; [#uses=2 type=i32]
  %i_i = phi i12 [ 0, %0 ], [ %i_1, %5 ]          ; [#uses=5 type=i12]
  %x = trunc i12 %i_i to i6, !dbg !191            ; [#uses=4 type=i6] [debug line = 14:29@211:2]
  %exitcond_i = icmp eq i12 %i_i, -1792, !dbg !191 ; [#uses=1 type=i1] [debug line = 14:29@211:2]
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 2304, i64 2304, i64 2304) nounwind ; [#uses=0 type=i32]
  %i_1 = add i12 1, %i_i, !dbg !194               ; [#uses=1 type=i12] [debug line = 14:41@211:2]
  br i1 %exitcond_i, label %initNodes.exit, label %2, !dbg !191 ; [debug line = 14:29@211:2]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([13 x i8]* @p_str) nounwind, !dbg !195 ; [debug line = 14:47@211:2]
  %tmp_2_i = zext i12 %i_i to i64, !dbg !197      ; [#uses=5 type=i64] [debug line = 15:3@211:2]
  %openNodes_addr = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_2_i, !dbg !197 ; [#uses=1 type=i1*] [debug line = 15:3@211:2]
  store i1 true, i1* %openNodes_addr, align 1, !dbg !197 ; [debug line = 15:3@211:2]
  call void @llvm.dbg.value(metadata !{i6 %x}, i64 0, metadata !198) nounwind, !dbg !199 ; [debug line = 17:3@211:2] [debug variable = x]
  %tmp_4_i = icmp ne i6 %x, 0, !dbg !200          ; [#uses=1 type=i1] [debug line = 18:3@211:2]
  %tmp_5_i = icmp eq i12 %i_i, 0, !dbg !200       ; [#uses=1 type=i1] [debug line = 18:3@211:2]
  %or_cond_i = or i1 %tmp_4_i, %tmp_5_i, !dbg !200 ; [#uses=1 type=i1] [debug line = 18:3@211:2]
  %y = add nsw i32 1, %y_i, !dbg !201             ; [#uses=1 type=i32] [debug line = 18:21@211:2]
  call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !202) nounwind, !dbg !201 ; [debug line = 18:21@211:2] [debug variable = y]
  %y_1 = select i1 %or_cond_i, i32 %y_i, i32 %y, !dbg !200 ; [#uses=3 type=i32] [debug line = 18:3@211:2]
  call void @llvm.dbg.value(metadata !{i32 %y_1}, i64 0, metadata !202) nounwind, !dbg !200 ; [debug line = 18:3@211:2] [debug variable = y]
  %tmp = trunc i32 %y_1 to i13                    ; [#uses=1 type=i13]
  %tmp_16 = call i11 @_ssdm_op_BitConcatenate.i11.i6.i5(i6 %x, i5 0) ; [#uses=1 type=i11]
  %p_shl_cast = zext i11 %tmp_16 to i12           ; [#uses=1 type=i12]
  %tmp_27 = call i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6 %x, i2 0) ; [#uses=1 type=i8]
  %p_shl1_cast = zext i8 %tmp_27 to i12, !dbg !203 ; [#uses=1 type=i12] [debug line = 20:3@211:2]
  %tmp_28 = add i12 %p_shl_cast, %p_shl1_cast, !dbg !203 ; [#uses=1 type=i12] [debug line = 20:3@211:2]
  %tmp_34_cast = zext i12 %tmp_28 to i13, !dbg !203 ; [#uses=1 type=i13] [debug line = 20:3@211:2]
  %tmp_29 = add i13 %tmp, %tmp_34_cast, !dbg !203 ; [#uses=1 type=i13] [debug line = 20:3@211:2]
  %tmp_35_cast = sext i13 %tmp_29 to i64, !dbg !203 ; [#uses=1 type=i64] [debug line = 20:3@211:2]
  %map_addr_2 = getelementptr [2304 x i32]* %map, i64 0, i64 %tmp_35_cast, !dbg !203 ; [#uses=1 type=i32*] [debug line = 20:3@211:2]
  %map_load = load i32* %map_addr_2, align 4, !dbg !203 ; [#uses=1 type=i32] [debug line = 20:3@211:2]
  %tmp_9_i = icmp eq i32 %map_load, 1, !dbg !203  ; [#uses=1 type=i1] [debug line = 20:3@211:2]
  br i1 %tmp_9_i, label %4, label %3, !dbg !203   ; [debug line = 20:3@211:2]

; <label>:3                                       ; preds = %2
  %node_coordinates_0_addr = getelementptr [2304 x i6]* @node_coordinates_0, i64 0, i64 %tmp_2_i, !dbg !204 ; [#uses=1 type=i6*] [debug line = 21:4@211:2]
  store i6 %x, i6* %node_coordinates_0_addr, align 1, !dbg !204 ; [debug line = 21:4@211:2]
  %node_coordinates_1_addr_2 = getelementptr [2304 x i32]* @node_coordinates_1, i64 0, i64 %tmp_2_i, !dbg !206 ; [#uses=1 type=i32*] [debug line = 22:4@211:2]
  store i32 %y_1, i32* %node_coordinates_1_addr_2, align 4, !dbg !206 ; [debug line = 22:4@211:2]
  %node_visited_addr_2 = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_2_i, !dbg !207 ; [#uses=1 type=i1*] [debug line = 23:4@211:2]
  store i1 false, i1* %node_visited_addr_2, align 1, !dbg !207 ; [debug line = 23:4@211:2]
  br label %5, !dbg !208                          ; [debug line = 24:3@211:2]

; <label>:4                                       ; preds = %2
  %node_visited_addr_1 = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_2_i, !dbg !209 ; [#uses=1 type=i1*] [debug line = 25:4@211:2]
  store i1 true, i1* %node_visited_addr_1, align 1, !dbg !209 ; [debug line = 25:4@211:2]
  br label %5

; <label>:5                                       ; preds = %4, %3
  call void @llvm.dbg.value(metadata !{i12 %i_1}, i64 0, metadata !211) nounwind, !dbg !194 ; [debug line = 14:41@211:2] [debug variable = i]
  br label %1, !dbg !194                          ; [debug line = 14:41@211:2]

initNodes.exit:                                   ; preds = %1
  %tmp_1 = shl i32 %yStart_read, 6, !dbg !212     ; [#uses=1 type=i32] [debug line = 214:35]
  %position_5 = add nsw i32 %xStart_read, %tmp_1, !dbg !212 ; [#uses=2 type=i32] [debug line = 214:35]
  call void @llvm.dbg.value(metadata !{i32 %position_5}, i64 0, metadata !213), !dbg !212 ; [debug line = 214:35] [debug variable = position]
  %tmp_s = sext i32 %position_5 to i64, !dbg !214 ; [#uses=5 type=i64] [debug line = 215:3]
  %node_father_addr = getelementptr [2304 x i32]* @node_father, i64 0, i64 %tmp_s, !dbg !214 ; [#uses=1 type=i32*] [debug line = 215:3]
  store i32 -1, i32* %node_father_addr, align 4, !dbg !214 ; [debug line = 215:3]
  %node_cost_addr = getelementptr [2304 x i32]* @node_cost, i64 0, i64 %tmp_s, !dbg !215 ; [#uses=1 type=i32*] [debug line = 216:2]
  store i32 0, i32* %node_cost_addr, align 4, !dbg !215 ; [debug line = 216:2]
  %node_heuristic_addr = getelementptr [2304 x i32]* @node_heuristic, i64 0, i64 %tmp_s, !dbg !216 ; [#uses=1 type=i32*] [debug line = 217:3]
  store i32 0, i32* %node_heuristic_addr, align 4, !dbg !216 ; [debug line = 217:3]
  %node_costPlusHeuristic_addr = getelementptr [2304 x i32]* @node_costPlusHeuristic, i64 0, i64 %tmp_s, !dbg !217 ; [#uses=1 type=i32*] [debug line = 218:2]
  store i32 0, i32* %node_costPlusHeuristic_addr, align 4, !dbg !217 ; [debug line = 218:2]
  %node_visited_addr = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_s, !dbg !218 ; [#uses=1 type=i1*] [debug line = 219:2]
  store i1 true, i1* %node_visited_addr, align 1, !dbg !218 ; [debug line = 219:2]
  call fastcc void @aStar_adjacentNodes(i32 %xStart_read, i32 %yStart_read), !dbg !219 ; [debug line = 222:2]
  br label %6, !dbg !220                          ; [debug line = 225:21]

; <label>:6                                       ; preds = %._crit_edge, %initNodes.exit
  %i = phi i4 [ 0, %initNodes.exit ], [ %i_2, %._crit_edge ] ; [#uses=4 type=i4]
  %exitcond1 = icmp eq i4 %i, -8, !dbg !220       ; [#uses=1 type=i1] [debug line = 225:21]
  %empty_4 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 8, i64 8, i64 8) nounwind ; [#uses=0 type=i32]
  %i_2 = add i4 %i, 1, !dbg !221                  ; [#uses=1 type=i4] [debug line = 225:30]
  br i1 %exitcond1, label %.preheader2, label %7, !dbg !220 ; [debug line = 225:21]

; <label>:7                                       ; preds = %6
  call void (...)* @_ssdm_op_SpecLoopName([5 x i8]* @p_str2) nounwind, !dbg !222 ; [debug line = 225:36]
  %tmp_17 = zext i4 %i to i64, !dbg !223          ; [#uses=3 type=i64] [debug line = 226:3]
  %adjacentPosition_2_addr = getelementptr [8 x i32]* @adjacentPosition_2, i64 0, i64 %tmp_17, !dbg !223 ; [#uses=1 type=i32*] [debug line = 226:3]
  %adjacentPosition_2_load = load i32* %adjacentPosition_2_addr, align 4, !dbg !223 ; [#uses=3 type=i32] [debug line = 226:3]
  %tmp_18 = sext i32 %adjacentPosition_2_load to i64, !dbg !223 ; [#uses=6 type=i64] [debug line = 226:3]
  %node_visited_addr_3 = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_18, !dbg !223 ; [#uses=1 type=i1*] [debug line = 226:3]
  %node_visited_load = load i1* %node_visited_addr_3, align 1 ; [#uses=1 type=i1]
  %tmp_19 = icmp eq i32 %adjacentPosition_2_load, -1, !dbg !223 ; [#uses=1 type=i1] [debug line = 226:3]
  %or_cond = or i1 %node_visited_load, %tmp_19, !dbg !223 ; [#uses=1 type=i1] [debug line = 226:3]
  br i1 %or_cond, label %._crit_edge, label %8, !dbg !223 ; [debug line = 226:3]

; <label>:8                                       ; preds = %7
  call void @llvm.dbg.value(metadata !{i32 %adjacentPosition_2_load}, i64 0, metadata !224), !dbg !229 ; [debug line = 35:19@227:4] [debug variable = position]
  %openNodes_addr_3 = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_18, !dbg !230 ; [#uses=1 type=i1*] [debug line = 36:2@227:4]
  store i1 false, i1* %openNodes_addr_3, align 1, !dbg !230 ; [debug line = 36:2@227:4]
  call void @llvm.dbg.value(metadata !{i32 %adjacentPosition_2_load}, i64 0, metadata !232), !dbg !233 ; [debug line = 30:26@228:4] [debug variable = position]
  call void @llvm.dbg.value(metadata !{i32 %xStart}, i64 0, metadata !178), !dbg !179 ; [debug line = 30:40@228:4] [debug variable = xFather]
  call void @llvm.dbg.value(metadata !{i32 %yStart}, i64 0, metadata !170), !dbg !175 ; [debug line = 30:53@228:4] [debug variable = yFather]
  call void @llvm.dbg.value(metadata !{i32 %position_5}, i64 0, metadata !234), !dbg !236 ; [debug line = 31:43@228:4] [debug variable = positionFather]
  %node_father_addr_1 = getelementptr [2304 x i32]* @node_father, i64 0, i64 %tmp_18, !dbg !237 ; [#uses=1 type=i32*] [debug line = 32:2@228:4]
  store i32 %position_5, i32* %node_father_addr_1, align 4, !dbg !237 ; [debug line = 32:2@228:4]
  %adjacentPosition_0_addr = getelementptr [8 x i32]* @adjacentPosition_0, i64 0, i64 %tmp_17, !dbg !149 ; [#uses=1 type=i32*] [debug line = 229:4]
  %adjacentPosition_0_load = load i32* %adjacentPosition_0_addr, align 4, !dbg !149 ; [#uses=1 type=i32] [debug line = 229:4]
  %adjacentPosition_1_addr = getelementptr [8 x i32]* @adjacentPosition_1, i64 0, i64 %tmp_17, !dbg !149 ; [#uses=1 type=i32*] [debug line = 229:4]
  %adjacentPosition_1_load = load i32* %adjacentPosition_1_addr, align 4, !dbg !149 ; [#uses=1 type=i32] [debug line = 229:4]
  call void @llvm.dbg.value(metadata !{i32 %adjacentPosition_0_load}, i64 0, metadata !238), !dbg !239 ; [debug line = 188:29@229:4] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i32 %adjacentPosition_1_load}, i64 0, metadata !240), !dbg !241 ; [debug line = 188:36@229:4] [debug variable = y]
  call void @llvm.dbg.value(metadata !{i32 %adjacentPosition_2_load}, i64 0, metadata !242), !dbg !243 ; [debug line = 188:43@229:4] [debug variable = position]
  call void @llvm.dbg.value(metadata !{i32 %xFinish}, i64 0, metadata !164), !dbg !165 ; [debug line = 188:57@229:4] [debug variable = xFinish]
  call void @llvm.dbg.value(metadata !{i32 %yFinish}, i64 0, metadata !145), !dbg !154 ; [debug line = 188:70@229:4] [debug variable = yFinish]
  %xDistance = sub nsw i32 %xFinish_read, %adjacentPosition_0_load, !dbg !244 ; [#uses=3 type=i32] [debug line = 190:2@229:4]
  call void @llvm.dbg.value(metadata !{i32 %xDistance}, i64 0, metadata !246), !dbg !244 ; [debug line = 190:2@229:4] [debug variable = xDistance]
  %yDistance = sub nsw i32 %yFinish_read, %adjacentPosition_1_load, !dbg !247 ; [#uses=3 type=i32] [debug line = 191:2@229:4]
  call void @llvm.dbg.value(metadata !{i32 %yDistance}, i64 0, metadata !248), !dbg !247 ; [debug line = 191:2@229:4] [debug variable = yDistance]
  %neg_i = sub i32 0, %xDistance                  ; [#uses=1 type=i32]
  %abscond_i = icmp sgt i32 %xDistance, 0         ; [#uses=1 type=i1]
  %abs_i = select i1 %abscond_i, i32 %xDistance, i32 %neg_i ; [#uses=1 type=i32]
  %neg1_i = sub i32 0, %yDistance                 ; [#uses=1 type=i32]
  %abscond2_i = icmp sgt i32 %yDistance, 0        ; [#uses=1 type=i1]
  %abs3_i = select i1 %abscond2_i, i32 %yDistance, i32 %neg1_i ; [#uses=1 type=i32]
  %tmp_i1 = add nsw i32 %abs3_i, %abs_i, !dbg !249 ; [#uses=3 type=i32] [debug line = 193:44@229:4]
  %node_heuristic_addr_1 = getelementptr [2304 x i32]* @node_heuristic, i64 0, i64 %tmp_18, !dbg !249 ; [#uses=1 type=i32*] [debug line = 193:44@229:4]
  store i32 %tmp_i1, i32* %node_heuristic_addr_1, align 4, !dbg !249 ; [debug line = 193:44@229:4]
  call fastcc void @aStar_calculateCost(i4 %i, i32 %adjacentPosition_2_load) nounwind, !dbg !250 ; [debug line = 230:4]
  call void @llvm.dbg.value(metadata !{i32 %adjacentPosition_2_load}, i64 0, metadata !251) nounwind, !dbg !254 ; [debug line = 204:28@231:4] [debug variable = position]
  %node_cost_addr_3 = getelementptr [2304 x i32]* @node_cost, i64 0, i64 %tmp_18, !dbg !255 ; [#uses=1 type=i32*] [debug line = 205:2@231:4]
  %node_cost_load = load i32* %node_cost_addr_3, align 4, !dbg !255 ; [#uses=1 type=i32] [debug line = 205:2@231:4]
  %tmp_3 = shl i32 %tmp_i1, 3, !dbg !255          ; [#uses=1 type=i32] [debug line = 205:2@231:4]
  %tmp_4 = shl i32 %tmp_i1, 1, !dbg !255          ; [#uses=1 type=i32] [debug line = 205:2@231:4]
  %tmp1 = add i32 %tmp_3, %tmp_4, !dbg !255       ; [#uses=1 type=i32] [debug line = 205:2@231:4]
  %tmp_1_i = add nsw i32 %tmp1, %node_cost_load, !dbg !255 ; [#uses=1 type=i32] [debug line = 205:2@231:4]
  %node_costPlusHeuristic_addr_1 = getelementptr [2304 x i32]* @node_costPlusHeuristic, i64 0, i64 %tmp_18, !dbg !255 ; [#uses=1 type=i32*] [debug line = 205:2@231:4]
  store i32 %tmp_1_i, i32* %node_costPlusHeuristic_addr_1, align 4, !dbg !255 ; [debug line = 205:2@231:4]
  br label %._crit_edge, !dbg !257                ; [debug line = 232:3]

._crit_edge:                                      ; preds = %8, %7
  call void @llvm.dbg.value(metadata !{i4 %i_2}, i64 0, metadata !258), !dbg !221 ; [debug line = 225:30] [debug variable = i]
  br label %6, !dbg !221                          ; [debug line = 225:30]

.preheader2:                                      ; preds = %_ifconv.i, %6
  %positionBestOption = phi i12 [ %i_4, %_ifconv.i ], [ 0, %6 ] ; [#uses=4 type=i12]
  %position_3 = phi i32 [ %positionBestOption_2_i, %_ifconv.i ], [ undef, %6 ] ; [#uses=4 type=i32]
  %bestOption_i = phi i32 [ %bestOption_2_i, %_ifconv.i ], [ 2147483647, %6 ] ; [#uses=3 type=i32]
  %positionBestOption_i_cast = zext i12 %positionBestOption to i32, !dbg !259 ; [#uses=1 type=i32] [debug line = 180:5@236:13]
  call void @llvm.dbg.value(metadata !{i12 %positionBestOption}, i64 0, metadata !269) nounwind, !dbg !259 ; [debug line = 180:5@236:13] [debug variable = positionBestOption]
  %exitcond_i1 = icmp eq i12 %positionBestOption, -1792, !dbg !270 ; [#uses=1 type=i1] [debug line = 176:39@236:13]
  %empty_5 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 2304, i64 2304, i64 2304) nounwind ; [#uses=0 type=i32]
  %i_4 = add i12 %positionBestOption, 1, !dbg !271 ; [#uses=1 type=i12] [debug line = 176:54@236:13]
  br i1 %exitcond_i1, label %calculateBestOption.exit, label %_ifconv.i, !dbg !270 ; [debug line = 176:39@236:13]

_ifconv.i:                                        ; preds = %.preheader2
  call void (...)* @_ssdm_op_SpecLoopName([23 x i8]* @p_str1) nounwind, !dbg !272 ; [debug line = 176:60@236:13]
  %tmp_i7 = zext i12 %positionBestOption to i64, !dbg !273 ; [#uses=2 type=i64] [debug line = 177:3@236:13]
  %openNodes_addr_2 = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_i7, !dbg !273 ; [#uses=1 type=i1*] [debug line = 177:3@236:13]
  %openNodes_load = load i1* %openNodes_addr_2, align 1 ; [#uses=2 type=i1]
  %node_costPlusHeuristic_addr_3 = getelementptr [2304 x i32]* @node_costPlusHeuristic, i64 0, i64 %tmp_i7, !dbg !274 ; [#uses=1 type=i32*] [debug line = 178:4@236:13]
  %bestOption = load i32* %node_costPlusHeuristic_addr_3, align 4, !dbg !274 ; [#uses=2 type=i32] [debug line = 178:4@236:13]
  call void @llvm.dbg.value(metadata !{i32 %bestOption}, i64 0, metadata !275) nounwind, !dbg !276 ; [debug line = 179:5@236:13] [debug variable = bestOption]
  %tmp_8_i9 = icmp slt i32 %bestOption, %bestOption_i, !dbg !274 ; [#uses=2 type=i1] [debug line = 178:4@236:13]
  %positionBestOption_positionBes = select i1 %tmp_8_i9, i32 %positionBestOption_i_cast, i32 %position_3, !dbg !274 ; [#uses=1 type=i32] [debug line = 178:4@236:13]
  %bestOption_1_bestOption_i = select i1 %tmp_8_i9, i32 %bestOption, i32 %bestOption_i, !dbg !274 ; [#uses=1 type=i32] [debug line = 178:4@236:13]
  %positionBestOption_2_i = select i1 %openNodes_load, i32 %position_3, i32 %positionBestOption_positionBes ; [#uses=1 type=i32]
  %bestOption_2_i = select i1 %openNodes_load, i32 %bestOption_i, i32 %bestOption_1_bestOption_i ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i12 %i_4}, i64 0, metadata !277) nounwind, !dbg !271 ; [debug line = 176:54@236:13] [debug variable = i]
  br label %.preheader2, !dbg !271                ; [debug line = 176:54@236:13]

calculateBestOption.exit:                         ; preds = %.preheader2
  call void @llvm.dbg.value(metadata !{i32 %position_3}, i64 0, metadata !213), !dbg !268 ; [debug line = 236:13] [debug variable = position]
  call void @llvm.dbg.value(metadata !{i32 %position_3}, i64 0, metadata !278), !dbg !281 ; [debug line = 39:20@238:2] [debug variable = position]
  %tmp_i = sext i32 %position_3 to i64, !dbg !282 ; [#uses=2 type=i64] [debug line = 40:2@238:2]
  %openNodes_addr_1 = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_i, !dbg !282 ; [#uses=1 type=i1*] [debug line = 40:2@238:2]
  store i1 true, i1* %openNodes_addr_1, align 1, !dbg !282 ; [debug line = 40:2@238:2]
  %node_visited_addr_4 = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_i, !dbg !284 ; [#uses=1 type=i1*] [debug line = 41:2@238:2]
  store i1 true, i1* %node_visited_addr_4, align 1, !dbg !284 ; [debug line = 41:2@238:2]
  %tmp_2 = shl i32 %yFinish_read, 6, !dbg !285    ; [#uses=1 type=i32] [debug line = 241:42]
  %finalPosition = add nsw i32 %xFinish_read, %tmp_2, !dbg !285 ; [#uses=2 type=i32] [debug line = 241:42]
  call void @llvm.dbg.value(metadata !{i32 %finalPosition}, i64 0, metadata !286), !dbg !285 ; [debug line = 241:42] [debug variable = finalPosition]
  br label %._crit_edge5, !dbg !287               ; [debug line = 244:2]

._crit_edge5:                                     ; preds = %calculateBestOption.exit28, %calculateBestOption.exit
  %position3 = phi i32 [ %position_3, %calculateBestOption.exit ], [ %position_4, %calculateBestOption.exit28 ] ; [#uses=1 type=i32]
  %tmp_20 = sext i32 %position3 to i64, !dbg !288 ; [#uses=2 type=i64] [debug line = 245:3]
  %node_coordinates_0_addr_1 = getelementptr [2304 x i6]* @node_coordinates_0, i64 0, i64 %tmp_20, !dbg !288 ; [#uses=2 type=i6*] [debug line = 245:3]
  %node_coordinates_0_load = load i6* %node_coordinates_0_addr_1, align 1 ; [#uses=1 type=i6]
  %extLd = zext i6 %node_coordinates_0_load to i32 ; [#uses=1 type=i32]
  %node_coordinates_1_addr = getelementptr [2304 x i32]* @node_coordinates_1, i64 0, i64 %tmp_20, !dbg !288 ; [#uses=2 type=i32*] [debug line = 245:3]
  %node_coordinates_1_load = load i32* %node_coordinates_1_addr, align 4, !dbg !288 ; [#uses=1 type=i32] [debug line = 245:3]
  call fastcc void @aStar_adjacentNodes(i32 %extLd, i32 %node_coordinates_1_load), !dbg !288 ; [debug line = 245:3]
  br label %9, !dbg !289                          ; [debug line = 246:22]

; <label>:9                                       ; preds = %._crit_edge3, %._crit_edge5
  %i1 = phi i4 [ 0, %._crit_edge5 ], [ %i_3, %._crit_edge3 ] ; [#uses=4 type=i4]
  %exitcond = icmp eq i4 %i1, -8, !dbg !289       ; [#uses=1 type=i1] [debug line = 246:22]
  %empty_6 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 8, i64 8, i64 8) nounwind ; [#uses=0 type=i32]
  %i_3 = add i4 %i1, 1, !dbg !290                 ; [#uses=1 type=i4] [debug line = 246:31]
  br i1 %exitcond, label %.preheader1, label %10, !dbg !289 ; [debug line = 246:22]

; <label>:10                                      ; preds = %9
  call void (...)* @_ssdm_op_SpecLoopName([5 x i8]* @p_str3) nounwind, !dbg !291 ; [debug line = 246:37]
  %tmp_21 = zext i4 %i1 to i64, !dbg !292         ; [#uses=3 type=i64] [debug line = 247:4]
  %adjacentPosition_2_addr_1 = getelementptr [8 x i32]* @adjacentPosition_2, i64 0, i64 %tmp_21, !dbg !292 ; [#uses=1 type=i32*] [debug line = 247:4]
  %adjacentPosition_2_load_1 = load i32* %adjacentPosition_2_addr_1, align 4, !dbg !292 ; [#uses=3 type=i32] [debug line = 247:4]
  %tmp_23 = sext i32 %adjacentPosition_2_load_1 to i64, !dbg !292 ; [#uses=6 type=i64] [debug line = 247:4]
  %node_visited_addr_5 = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_23, !dbg !292 ; [#uses=1 type=i1*] [debug line = 247:4]
  %node_visited_load_1 = load i1* %node_visited_addr_5, align 1 ; [#uses=1 type=i1]
  %tmp_24 = icmp eq i32 %adjacentPosition_2_load_1, -1, !dbg !292 ; [#uses=1 type=i1] [debug line = 247:4]
  %or_cond1 = or i1 %node_visited_load_1, %tmp_24, !dbg !292 ; [#uses=1 type=i1] [debug line = 247:4]
  br i1 %or_cond1, label %._crit_edge3, label %11, !dbg !292 ; [debug line = 247:4]

; <label>:11                                      ; preds = %10
  call void @llvm.dbg.value(metadata !{i32 %adjacentPosition_2_load_1}, i64 0, metadata !293), !dbg !295 ; [debug line = 35:19@248:5] [debug variable = position]
  %openNodes_addr_6 = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_23, !dbg !296 ; [#uses=1 type=i1*] [debug line = 36:2@248:5]
  store i1 false, i1* %openNodes_addr_6, align 1, !dbg !296 ; [debug line = 36:2@248:5]
  %node_coordinates_0_load_1 = load i6* %node_coordinates_0_addr_1, align 1 ; [#uses=1 type=i6]
  %node_coordinates_1_load_2 = load i32* %node_coordinates_1_addr, align 4, !dbg !297 ; [#uses=1 type=i32] [debug line = 249:5]
  call void @llvm.dbg.value(metadata !{i32 %adjacentPosition_2_load_1}, i64 0, metadata !298), !dbg !299 ; [debug line = 30:26@249:5] [debug variable = position]
  call void @llvm.dbg.value(metadata !{i32 %node_coordinates_1_load_2}, i64 0, metadata !300), !dbg !301 ; [debug line = 30:53@249:5] [debug variable = yFather]
  %tmp_5 = trunc i32 %node_coordinates_1_load_2 to i26 ; [#uses=1 type=i26]
  %positionFather_1 = call i32 @_ssdm_op_BitConcatenate.i32.i26.i6(i26 %tmp_5, i6 %node_coordinates_0_load_1), !dbg !302 ; [#uses=1 type=i32] [debug line = 31:43@249:5]
  call void @llvm.dbg.value(metadata !{i32 %positionFather_1}, i64 0, metadata !303), !dbg !302 ; [debug line = 31:43@249:5] [debug variable = positionFather]
  %node_father_addr_3 = getelementptr [2304 x i32]* @node_father, i64 0, i64 %tmp_23, !dbg !304 ; [#uses=1 type=i32*] [debug line = 32:2@249:5]
  store i32 %positionFather_1, i32* %node_father_addr_3, align 4, !dbg !304 ; [debug line = 32:2@249:5]
  %adjacentPosition_0_addr_1 = getelementptr [8 x i32]* @adjacentPosition_0, i64 0, i64 %tmp_21, !dbg !156 ; [#uses=1 type=i32*] [debug line = 250:5]
  %adjacentPosition_0_load_1 = load i32* %adjacentPosition_0_addr_1, align 4, !dbg !156 ; [#uses=1 type=i32] [debug line = 250:5]
  %adjacentPosition_1_addr_1 = getelementptr [8 x i32]* @adjacentPosition_1, i64 0, i64 %tmp_21, !dbg !156 ; [#uses=1 type=i32*] [debug line = 250:5]
  %adjacentPosition_1_load_1 = load i32* %adjacentPosition_1_addr_1, align 4, !dbg !156 ; [#uses=1 type=i32] [debug line = 250:5]
  call void @llvm.dbg.value(metadata !{i32 %adjacentPosition_0_load_1}, i64 0, metadata !305), !dbg !306 ; [debug line = 188:29@250:5] [debug variable = x]
  call void @llvm.dbg.value(metadata !{i32 %adjacentPosition_1_load_1}, i64 0, metadata !307), !dbg !308 ; [debug line = 188:36@250:5] [debug variable = y]
  call void @llvm.dbg.value(metadata !{i32 %adjacentPosition_2_load_1}, i64 0, metadata !309), !dbg !310 ; [debug line = 188:43@250:5] [debug variable = position]
  call void @llvm.dbg.value(metadata !{i32 %xFinish}, i64 0, metadata !166), !dbg !167 ; [debug line = 188:57@250:5] [debug variable = xFinish]
  call void @llvm.dbg.value(metadata !{i32 %yFinish}, i64 0, metadata !155), !dbg !161 ; [debug line = 188:70@250:5] [debug variable = yFinish]
  %xDistance_1 = sub nsw i32 %xFinish_read, %adjacentPosition_0_load_1, !dbg !311 ; [#uses=3 type=i32] [debug line = 190:2@250:5]
  call void @llvm.dbg.value(metadata !{i32 %xDistance_1}, i64 0, metadata !312), !dbg !311 ; [debug line = 190:2@250:5] [debug variable = xDistance]
  %yDistance_1 = sub nsw i32 %yFinish_read, %adjacentPosition_1_load_1, !dbg !313 ; [#uses=3 type=i32] [debug line = 191:2@250:5]
  call void @llvm.dbg.value(metadata !{i32 %yDistance_1}, i64 0, metadata !314), !dbg !313 ; [debug line = 191:2@250:5] [debug variable = yDistance]
  %neg_i1 = sub i32 0, %xDistance_1               ; [#uses=1 type=i32]
  %abscond_i1 = icmp sgt i32 %xDistance_1, 0      ; [#uses=1 type=i1]
  %abs_i1 = select i1 %abscond_i1, i32 %xDistance_1, i32 %neg_i1 ; [#uses=1 type=i32]
  %neg1_i1 = sub i32 0, %yDistance_1              ; [#uses=1 type=i32]
  %abscond2_i1 = icmp sgt i32 %yDistance_1, 0     ; [#uses=1 type=i1]
  %abs3_i1 = select i1 %abscond2_i1, i32 %yDistance_1, i32 %neg1_i1 ; [#uses=1 type=i32]
  %tmp_i5 = add nsw i32 %abs_i1, %abs3_i1, !dbg !315 ; [#uses=3 type=i32] [debug line = 193:44@250:5]
  %node_heuristic_addr_2 = getelementptr [2304 x i32]* @node_heuristic, i64 0, i64 %tmp_23, !dbg !315 ; [#uses=1 type=i32*] [debug line = 193:44@250:5]
  store i32 %tmp_i5, i32* %node_heuristic_addr_2, align 4, !dbg !315 ; [debug line = 193:44@250:5]
  call fastcc void @aStar_calculateCost(i4 %i1, i32 %adjacentPosition_2_load_1) nounwind, !dbg !316 ; [debug line = 251:5]
  call void @llvm.dbg.value(metadata !{i32 %adjacentPosition_2_load_1}, i64 0, metadata !317) nounwind, !dbg !319 ; [debug line = 204:28@252:5] [debug variable = position]
  %node_cost_addr_4 = getelementptr [2304 x i32]* @node_cost, i64 0, i64 %tmp_23, !dbg !320 ; [#uses=1 type=i32*] [debug line = 205:2@252:5]
  %node_cost_load_2 = load i32* %node_cost_addr_4, align 4, !dbg !320 ; [#uses=1 type=i32] [debug line = 205:2@252:5]
  %tmp_6 = shl i32 %tmp_i5, 3, !dbg !320          ; [#uses=1 type=i32] [debug line = 205:2@252:5]
  %tmp_7 = shl i32 %tmp_i5, 1, !dbg !320          ; [#uses=1 type=i32] [debug line = 205:2@252:5]
  %tmp2 = add i32 %tmp_7, %tmp_6, !dbg !320       ; [#uses=1 type=i32] [debug line = 205:2@252:5]
  %tmp_1_i1 = add nsw i32 %node_cost_load_2, %tmp2, !dbg !320 ; [#uses=1 type=i32] [debug line = 205:2@252:5]
  %node_costPlusHeuristic_addr_2 = getelementptr [2304 x i32]* @node_costPlusHeuristic, i64 0, i64 %tmp_23, !dbg !320 ; [#uses=1 type=i32*] [debug line = 205:2@252:5]
  store i32 %tmp_1_i1, i32* %node_costPlusHeuristic_addr_2, align 4, !dbg !320 ; [debug line = 205:2@252:5]
  br label %._crit_edge3, !dbg !321               ; [debug line = 253:4]

._crit_edge3:                                     ; preds = %11, %10
  call void @llvm.dbg.value(metadata !{i4 %i_3}, i64 0, metadata !322), !dbg !290 ; [debug line = 246:31] [debug variable = i]
  br label %9, !dbg !290                          ; [debug line = 246:31]

.preheader1:                                      ; preds = %_ifconv.i27, %9
  %positionBestOption_1 = phi i12 [ %i_5, %_ifconv.i27 ], [ 0, %9 ] ; [#uses=4 type=i12]
  %position_4 = phi i32 [ %positionBestOption_2_i1, %_ifconv.i27 ], [ undef, %9 ] ; [#uses=5 type=i32]
  %bestOption_i1 = phi i32 [ %bestOption_2_i1, %_ifconv.i27 ], [ 2147483647, %9 ] ; [#uses=3 type=i32]
  %positionBestOption_i11_cast = zext i12 %positionBestOption_1 to i32, !dbg !323 ; [#uses=1 type=i32] [debug line = 180:5@258:14]
  call void @llvm.dbg.value(metadata !{i12 %positionBestOption_1}, i64 0, metadata !325) nounwind, !dbg !323 ; [debug line = 180:5@258:14] [debug variable = positionBestOption]
  %exitcond_i2 = icmp eq i12 %positionBestOption_1, -1792, !dbg !326 ; [#uses=1 type=i1] [debug line = 176:39@258:14]
  %empty_7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 2304, i64 2304, i64 2304) nounwind ; [#uses=0 type=i32]
  %i_5 = add i12 %positionBestOption_1, 1, !dbg !327 ; [#uses=1 type=i12] [debug line = 176:54@258:14]
  br i1 %exitcond_i2, label %calculateBestOption.exit28, label %_ifconv.i27, !dbg !326 ; [debug line = 176:39@258:14]

_ifconv.i27:                                      ; preds = %.preheader1
  call void (...)* @_ssdm_op_SpecLoopName([23 x i8]* @p_str1) nounwind, !dbg !328 ; [debug line = 176:60@258:14]
  %tmp_i8 = zext i12 %positionBestOption_1 to i64, !dbg !329 ; [#uses=2 type=i64] [debug line = 177:3@258:14]
  %openNodes_addr_5 = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_i8, !dbg !329 ; [#uses=1 type=i1*] [debug line = 177:3@258:14]
  %openNodes_load_1 = load i1* %openNodes_addr_5, align 1 ; [#uses=2 type=i1]
  %node_costPlusHeuristic_addr_4 = getelementptr [2304 x i32]* @node_costPlusHeuristic, i64 0, i64 %tmp_i8, !dbg !330 ; [#uses=1 type=i32*] [debug line = 178:4@258:14]
  %bestOption_1 = load i32* %node_costPlusHeuristic_addr_4, align 4, !dbg !330 ; [#uses=2 type=i32] [debug line = 178:4@258:14]
  call void @llvm.dbg.value(metadata !{i32 %bestOption_1}, i64 0, metadata !331) nounwind, !dbg !332 ; [debug line = 179:5@258:14] [debug variable = bestOption]
  %tmp_8_i1 = icmp slt i32 %bestOption_1, %bestOption_i1, !dbg !330 ; [#uses=2 type=i1] [debug line = 178:4@258:14]
  %positionBestOption_positionBes_1 = select i1 %tmp_8_i1, i32 %positionBestOption_i11_cast, i32 %position_4, !dbg !330 ; [#uses=1 type=i32] [debug line = 178:4@258:14]
  %bestOption_1_bestOption_i1 = select i1 %tmp_8_i1, i32 %bestOption_1, i32 %bestOption_i1, !dbg !330 ; [#uses=1 type=i32] [debug line = 178:4@258:14]
  %positionBestOption_2_i1 = select i1 %openNodes_load_1, i32 %position_4, i32 %positionBestOption_positionBes_1 ; [#uses=1 type=i32]
  %bestOption_2_i1 = select i1 %openNodes_load_1, i32 %bestOption_i1, i32 %bestOption_1_bestOption_i1 ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i12 %i_5}, i64 0, metadata !333) nounwind, !dbg !327 ; [debug line = 176:54@258:14] [debug variable = i]
  br label %.preheader1, !dbg !327                ; [debug line = 176:54@258:14]

calculateBestOption.exit28:                       ; preds = %.preheader1
  call void @llvm.dbg.value(metadata !{i32 %position_4}, i64 0, metadata !213), !dbg !324 ; [debug line = 258:14] [debug variable = position]
  call void @llvm.dbg.value(metadata !{i32 %position_4}, i64 0, metadata !334), !dbg !336 ; [debug line = 39:20@260:3] [debug variable = position]
  %tmp_i3 = sext i32 %position_4 to i64, !dbg !337 ; [#uses=2 type=i64] [debug line = 40:2@260:3]
  %openNodes_addr_4 = getelementptr [2304 x i1]* @openNodes, i64 0, i64 %tmp_i3, !dbg !337 ; [#uses=1 type=i1*] [debug line = 40:2@260:3]
  store i1 true, i1* %openNodes_addr_4, align 1, !dbg !337 ; [debug line = 40:2@260:3]
  %node_visited_addr_6 = getelementptr [2304 x i1]* @node_visited, i64 0, i64 %tmp_i3, !dbg !338 ; [#uses=1 type=i1*] [debug line = 41:2@260:3]
  store i1 true, i1* %node_visited_addr_6, align 1, !dbg !338 ; [debug line = 41:2@260:3]
  %tmp_22 = icmp eq i32 %position_4, %finalPosition, !dbg !339 ; [#uses=1 type=i1] [debug line = 261:2]
  br i1 %tmp_22, label %.preheader, label %._crit_edge5, !dbg !339 ; [debug line = 261:2]

.preheader:                                       ; preds = %12, %calculateBestOption.exit28
  %position_1 = phi i32 [ %position, %12 ], [ %finalPosition, %calculateBestOption.exit28 ] ; [#uses=1 type=i32]
  %tmp_25 = sext i32 %position_1 to i64, !dbg !340 ; [#uses=3 type=i64] [debug line = 264:2]
  %node_father_addr_2 = getelementptr [2304 x i32]* @node_father, i64 0, i64 %tmp_25, !dbg !340 ; [#uses=1 type=i32*] [debug line = 264:2]
  %position = load i32* %node_father_addr_2, align 4, !dbg !340 ; [#uses=2 type=i32] [debug line = 264:2]
  %tmp_26 = icmp eq i32 %position, -1, !dbg !340  ; [#uses=1 type=i1] [debug line = 264:2]
  br i1 %tmp_26, label %13, label %12, !dbg !340  ; [debug line = 264:2]

; <label>:12                                      ; preds = %.preheader
  %node_coordinates_1_addr_1 = getelementptr [2304 x i32]* @node_coordinates_1, i64 0, i64 %tmp_25, !dbg !341 ; [#uses=1 type=i32*] [debug line = 265:3]
  %node_coordinates_1_load_1 = load i32* %node_coordinates_1_addr_1, align 4, !dbg !341 ; [#uses=1 type=i32] [debug line = 265:3]
  %tmp_11 = trunc i32 %node_coordinates_1_load_1 to i13, !dbg !341 ; [#uses=1 type=i13] [debug line = 265:3]
  %node_coordinates_0_addr_2 = getelementptr [2304 x i6]* @node_coordinates_0, i64 0, i64 %tmp_25, !dbg !341 ; [#uses=1 type=i6*] [debug line = 265:3]
  %node_coordinates_0_load_2 = load i6* %node_coordinates_0_addr_2, align 1 ; [#uses=2 type=i6]
  %tmp_12 = call i11 @_ssdm_op_BitConcatenate.i11.i6.i5(i6 %node_coordinates_0_load_2, i5 0) ; [#uses=1 type=i11]
  %p_shl2_cast = zext i11 %tmp_12 to i13          ; [#uses=1 type=i13]
  %tmp_13 = call i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6 %node_coordinates_0_load_2, i2 0) ; [#uses=1 type=i8]
  %p_shl3_cast = zext i8 %tmp_13 to i13, !dbg !341 ; [#uses=1 type=i13] [debug line = 265:3]
  %tmp_32 = add i13 %p_shl3_cast, %p_shl2_cast, !dbg !341 ; [#uses=1 type=i13] [debug line = 265:3]
  %tmp_33 = add i13 %tmp_32, %tmp_11, !dbg !341   ; [#uses=1 type=i13] [debug line = 265:3]
  %tmp_49_cast = sext i13 %tmp_33 to i64, !dbg !341 ; [#uses=1 type=i64] [debug line = 265:3]
  %map_addr_1 = getelementptr [2304 x i32]* %map, i64 0, i64 %tmp_49_cast, !dbg !341 ; [#uses=1 type=i32*] [debug line = 265:3]
  store i32 2, i32* %map_addr_1, align 4, !dbg !341 ; [debug line = 265:3]
  call void @llvm.dbg.value(metadata !{i32 %position}, i64 0, metadata !213), !dbg !343 ; [debug line = 266:3] [debug variable = position]
  br label %.preheader, !dbg !344                 ; [debug line = 267:2]

; <label>:13                                      ; preds = %.preheader
  %tmp_8 = trunc i32 %yFinish_read to i13         ; [#uses=1 type=i13]
  %tmp_9 = trunc i32 %xFinish_read to i8          ; [#uses=1 type=i8]
  %p_shl4_cast = call i13 @_ssdm_op_BitConcatenate.i13.i8.i5(i8 %tmp_9, i5 0) ; [#uses=1 type=i13]
  %tmp_10 = trunc i32 %xFinish_read to i11        ; [#uses=1 type=i11]
  %p_shl5_cast = call i13 @_ssdm_op_BitConcatenate.i13.i11.i2(i11 %tmp_10, i2 0), !dbg !345 ; [#uses=1 type=i13] [debug line = 269:2]
  %tmp_30 = add i13 %p_shl4_cast, %p_shl5_cast, !dbg !345 ; [#uses=1 type=i13] [debug line = 269:2]
  %tmp_31 = add i13 %tmp_8, %tmp_30, !dbg !345    ; [#uses=1 type=i13] [debug line = 269:2]
  %tmp_45_cast = sext i13 %tmp_31 to i64, !dbg !345 ; [#uses=1 type=i64] [debug line = 269:2]
  %map_addr = getelementptr [2304 x i32]* %map, i64 0, i64 %tmp_45_cast, !dbg !345 ; [#uses=1 type=i32*] [debug line = 269:2]
  store i32 4, i32* %map_addr, align 4, !dbg !345 ; [debug line = 269:2]
  ret i32 0, !dbg !346                            ; [debug line = 271:2]
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=5]
define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

; [#uses=5]
define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

; [#uses=6]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=1]
define weak i4 @_ssdm_op_Read.ap_auto.i4(i4) {
entry:
  ret i4 %0
}

; [#uses=7]
define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

; [#uses=0]
declare i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i6 @_ssdm_op_PartSelect.i6.i12.i32.i32(i12, i32, i32) nounwind readnone

; [#uses=0]
declare i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i29 @_ssdm_op_PartSelect.i29.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=1]
define weak i2 @_ssdm_op_PartSelect.i2.i4.i32.i32(i4, i32, i32) nounwind readnone {
entry:
  %empty = call i4 @llvm.part.select.i4(i4 %0, i32 %1, i32 %2) ; [#uses=1 type=i4]
  %empty_8 = trunc i4 %empty to i2                ; [#uses=1 type=i2]
  ret i2 %empty_8
}

; [#uses=0]
declare i13 @_ssdm_op_PartSelect.i13.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i11 @_ssdm_op_PartSelect.i11.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i16 @_ssdm_op_HSub(...)

; [#uses=0]
declare i16 @_ssdm_op_HMul(...)

; [#uses=0]
declare i16 @_ssdm_op_HDiv(...)

; [#uses=0]
declare i16 @_ssdm_op_HAdd(...)

; [#uses=2]
define weak i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6, i2) nounwind readnone {
entry:
  %empty = zext i6 %0 to i8                       ; [#uses=1 type=i8]
  %empty_9 = zext i2 %1 to i8                     ; [#uses=1 type=i8]
  %empty_10 = shl i8 %empty, 2                    ; [#uses=1 type=i8]
  %empty_11 = or i8 %empty_10, %empty_9           ; [#uses=1 type=i8]
  ret i8 %empty_11
}

; [#uses=0]
declare i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31, i1) nounwind readnone

; [#uses=0]
declare i32 @_ssdm_op_BitConcatenate.i32.i29.i3(i29, i3) nounwind readnone

; [#uses=1]
define weak i32 @_ssdm_op_BitConcatenate.i32.i26.i6(i26, i6) nounwind readnone {
entry:
  %empty = zext i26 %0 to i32                     ; [#uses=1 type=i32]
  %empty_12 = zext i6 %1 to i32                   ; [#uses=1 type=i32]
  %empty_13 = shl i32 %empty, 6                   ; [#uses=1 type=i32]
  %empty_14 = or i32 %empty_13, %empty_12         ; [#uses=1 type=i32]
  ret i32 %empty_14
}

; [#uses=1]
define weak i13 @_ssdm_op_BitConcatenate.i13.i8.i5(i8, i5) nounwind readnone {
entry:
  %empty = zext i8 %0 to i13                      ; [#uses=1 type=i13]
  %empty_15 = zext i5 %1 to i13                   ; [#uses=1 type=i13]
  %empty_16 = shl i13 %empty, 5                   ; [#uses=1 type=i13]
  %empty_17 = or i13 %empty_16, %empty_15         ; [#uses=1 type=i13]
  ret i13 %empty_17
}

; [#uses=1]
define weak i13 @_ssdm_op_BitConcatenate.i13.i11.i2(i11, i2) nounwind readnone {
entry:
  %empty = zext i11 %0 to i13                     ; [#uses=1 type=i13]
  %empty_18 = zext i2 %1 to i13                   ; [#uses=1 type=i13]
  %empty_19 = shl i13 %empty, 2                   ; [#uses=1 type=i13]
  %empty_20 = or i13 %empty_19, %empty_18         ; [#uses=1 type=i13]
  ret i13 %empty_20
}

; [#uses=2]
define weak i11 @_ssdm_op_BitConcatenate.i11.i6.i5(i6, i5) nounwind readnone {
entry:
  %empty = zext i6 %0 to i11                      ; [#uses=1 type=i11]
  %empty_21 = zext i5 %1 to i11                   ; [#uses=1 type=i11]
  %empty_22 = shl i11 %empty, 5                   ; [#uses=1 type=i11]
  %empty_23 = or i11 %empty_22, %empty_21         ; [#uses=1 type=i11]
  ret i11 %empty_23
}

; [#uses=1]
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
!7 = metadata !{i32 786689, metadata !8, metadata !"position", metadata !9, i32 33554628, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!8 = metadata !{i32 786478, i32 0, metadata !9, metadata !"calculateCost", metadata !"calculateCost", metadata !"_Z13calculateCostii", metadata !9, i32 196, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !13, i32 196} ; [ DW_TAG_subprogram ]
!9 = metadata !{i32 786473, metadata !"aStarStatic.cpp", metadata !"/home/jose/tfg.jose.jimenez/VivadoHLS/AStarStatic", null} ; [ DW_TAG_file_type ]
!10 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!11 = metadata !{null, metadata !12, metadata !12}
!12 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!13 = metadata !{metadata !14}
!14 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!15 = metadata !{i32 196, i32 31, metadata !8, null}
!16 = metadata !{i32 786689, metadata !8, metadata !"i", metadata !9, i32 16777412, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!17 = metadata !{i32 196, i32 24, metadata !8, null}
!18 = metadata !{i32 197, i32 2, metadata !19, null}
!19 = metadata !{i32 786443, metadata !8, i32 196, i32 40, metadata !9, i32 21} ; [ DW_TAG_lexical_block ]
!20 = metadata !{i32 198, i32 3, metadata !21, null}
!21 = metadata !{i32 786443, metadata !19, i32 197, i32 9, metadata !9, i32 22} ; [ DW_TAG_lexical_block ]
!22 = metadata !{i32 199, i32 2, metadata !21, null}
!23 = metadata !{i32 200, i32 3, metadata !24, null}
!24 = metadata !{i32 786443, metadata !19, i32 199, i32 7, metadata !9, i32 23} ; [ DW_TAG_lexical_block ]
!25 = metadata !{i32 202, i32 1, metadata !19, null}
!26 = metadata !{i32 786689, metadata !27, metadata !"y", metadata !9, i32 33554476, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!27 = metadata !{i32 786478, i32 0, metadata !9, metadata !"adjacentNodes", metadata !"adjacentNodes", metadata !"_Z13adjacentNodesii", metadata !9, i32 44, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32)* @aStar_adjacentNodes, null, null, metadata !13, i32 44} ; [ DW_TAG_subprogram ]
!28 = metadata !{i32 44, i32 31, metadata !27, null}
!29 = metadata !{i32 786689, metadata !27, metadata !"x", metadata !9, i32 16777260, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!30 = metadata !{i32 44, i32 24, metadata !27, null}
!31 = metadata !{i32 45, i32 29, metadata !32, null}
!32 = metadata !{i32 786443, metadata !27, i32 44, i32 33, metadata !9, i32 8} ; [ DW_TAG_lexical_block ]
!33 = metadata !{i32 786688, metadata !32, metadata !"initPosition", metadata !9, i32 45, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!34 = metadata !{i32 47, i32 2, metadata !32, null}
!35 = metadata !{i32 49, i32 2, metadata !32, null}
!36 = metadata !{i32 51, i32 2, metadata !32, null}
!37 = metadata !{i32 53, i32 2, metadata !32, null}
!38 = metadata !{i32 55, i32 2, metadata !32, null}
!39 = metadata !{i32 57, i32 2, metadata !32, null}
!40 = metadata !{i32 59, i32 2, metadata !32, null}
!41 = metadata !{i32 61, i32 2, metadata !32, null}
!42 = metadata !{i32 64, i32 2, metadata !32, null}
!43 = metadata !{i32 66, i32 3, metadata !44, null}
!44 = metadata !{i32 786443, metadata !32, i32 64, i32 10, metadata !9, i32 9} ; [ DW_TAG_lexical_block ]
!45 = metadata !{i32 68, i32 3, metadata !44, null}
!46 = metadata !{i32 70, i32 3, metadata !44, null}
!47 = metadata !{i32 72, i32 3, metadata !44, null}
!48 = metadata !{i32 74, i32 3, metadata !44, null}
!49 = metadata !{i32 76, i32 3, metadata !44, null}
!50 = metadata !{i32 78, i32 3, metadata !44, null}
!51 = metadata !{i32 80, i32 3, metadata !44, null}
!52 = metadata !{i32 81, i32 2, metadata !44, null}
!53 = metadata !{i32 81, i32 8, metadata !32, null}
!54 = metadata !{i32 83, i32 3, metadata !55, null}
!55 = metadata !{i32 786443, metadata !32, i32 81, i32 20, metadata !9, i32 10} ; [ DW_TAG_lexical_block ]
!56 = metadata !{i32 85, i32 3, metadata !55, null}
!57 = metadata !{i32 87, i32 3, metadata !55, null}
!58 = metadata !{i32 89, i32 3, metadata !55, null}
!59 = metadata !{i32 91, i32 3, metadata !55, null}
!60 = metadata !{i32 93, i32 3, metadata !55, null}
!61 = metadata !{i32 95, i32 3, metadata !55, null}
!62 = metadata !{i32 97, i32 3, metadata !55, null}
!63 = metadata !{i32 98, i32 2, metadata !55, null}
!64 = metadata !{i32 100, i32 3, metadata !65, null}
!65 = metadata !{i32 786443, metadata !32, i32 98, i32 7, metadata !9, i32 11} ; [ DW_TAG_lexical_block ]
!66 = metadata !{i32 102, i32 3, metadata !65, null}
!67 = metadata !{i32 104, i32 3, metadata !65, null}
!68 = metadata !{i32 106, i32 3, metadata !65, null}
!69 = metadata !{i32 108, i32 3, metadata !65, null}
!70 = metadata !{i32 110, i32 3, metadata !65, null}
!71 = metadata !{i32 112, i32 3, metadata !65, null}
!72 = metadata !{i32 114, i32 3, metadata !65, null}
!73 = metadata !{i32 117, i32 2, metadata !32, null}
!74 = metadata !{i32 119, i32 3, metadata !75, null}
!75 = metadata !{i32 786443, metadata !32, i32 117, i32 10, metadata !9, i32 12} ; [ DW_TAG_lexical_block ]
!76 = metadata !{i32 121, i32 3, metadata !75, null}
!77 = metadata !{i32 123, i32 3, metadata !75, null}
!78 = metadata !{i32 125, i32 3, metadata !75, null}
!79 = metadata !{i32 127, i32 3, metadata !75, null}
!80 = metadata !{i32 129, i32 3, metadata !75, null}
!81 = metadata !{i32 131, i32 3, metadata !75, null}
!82 = metadata !{i32 133, i32 3, metadata !75, null}
!83 = metadata !{i32 134, i32 2, metadata !75, null}
!84 = metadata !{i32 134, i32 8, metadata !32, null}
!85 = metadata !{i32 136, i32 3, metadata !86, null}
!86 = metadata !{i32 786443, metadata !32, i32 134, i32 21, metadata !9, i32 13} ; [ DW_TAG_lexical_block ]
!87 = metadata !{i32 138, i32 3, metadata !86, null}
!88 = metadata !{i32 140, i32 3, metadata !86, null}
!89 = metadata !{i32 142, i32 3, metadata !86, null}
!90 = metadata !{i32 144, i32 3, metadata !86, null}
!91 = metadata !{i32 146, i32 3, metadata !86, null}
!92 = metadata !{i32 148, i32 3, metadata !86, null}
!93 = metadata !{i32 150, i32 3, metadata !86, null}
!94 = metadata !{i32 151, i32 2, metadata !86, null}
!95 = metadata !{i32 153, i32 3, metadata !96, null}
!96 = metadata !{i32 786443, metadata !32, i32 151, i32 7, metadata !9, i32 14} ; [ DW_TAG_lexical_block ]
!97 = metadata !{i32 155, i32 3, metadata !96, null}
!98 = metadata !{i32 157, i32 3, metadata !96, null}
!99 = metadata !{i32 159, i32 3, metadata !96, null}
!100 = metadata !{i32 161, i32 3, metadata !96, null}
!101 = metadata !{i32 163, i32 3, metadata !96, null}
!102 = metadata !{i32 165, i32 3, metadata !96, null}
!103 = metadata !{i32 167, i32 3, metadata !96, null}
!104 = metadata !{i32 170, i32 1, metadata !32, null}
!105 = metadata !{metadata !106}
!106 = metadata !{i32 0, i32 31, metadata !107}
!107 = metadata !{metadata !108}
!108 = metadata !{metadata !"xStart", metadata !109, metadata !"int", i32 0, i32 31}
!109 = metadata !{metadata !110}
!110 = metadata !{i32 0, i32 0, i32 0}
!111 = metadata !{metadata !112}
!112 = metadata !{i32 0, i32 31, metadata !113}
!113 = metadata !{metadata !114}
!114 = metadata !{metadata !"yStart", metadata !109, metadata !"int", i32 0, i32 31}
!115 = metadata !{metadata !116}
!116 = metadata !{i32 0, i32 31, metadata !117}
!117 = metadata !{metadata !118}
!118 = metadata !{metadata !"xFinish", metadata !109, metadata !"int", i32 0, i32 31}
!119 = metadata !{metadata !120}
!120 = metadata !{i32 0, i32 31, metadata !121}
!121 = metadata !{metadata !122}
!122 = metadata !{metadata !"yFinish", metadata !109, metadata !"int", i32 0, i32 31}
!123 = metadata !{metadata !124}
!124 = metadata !{i32 0, i32 31, metadata !125}
!125 = metadata !{metadata !126}
!126 = metadata !{metadata !"map", metadata !127, metadata !"int", i32 0, i32 31}
!127 = metadata !{metadata !128, metadata !129}
!128 = metadata !{i32 0, i32 63, i32 1}
!129 = metadata !{i32 0, i32 35, i32 1}
!130 = metadata !{metadata !131}
!131 = metadata !{i32 0, i32 31, metadata !132}
!132 = metadata !{metadata !133}
!133 = metadata !{metadata !"return", metadata !134, metadata !"int", i32 0, i32 31}
!134 = metadata !{metadata !135}
!135 = metadata !{i32 0, i32 1, i32 0}
!136 = metadata !{i32 786689, metadata !137, metadata !"yFinish", metadata !9, i32 67109072, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!137 = metadata !{i32 786478, i32 0, metadata !9, metadata !"aStar", metadata !"aStar", metadata !"_Z5aStariiiiPA36_i", metadata !9, i32 208, metadata !138, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !13, i32 208} ; [ DW_TAG_subprogram ]
!138 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !139, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!139 = metadata !{metadata !12, metadata !12, metadata !12, metadata !12, metadata !12, metadata !140}
!140 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !141} ; [ DW_TAG_pointer_type ]
!141 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1152, i64 32, i32 0, i32 0, metadata !12, metadata !142, i32 0, i32 0} ; [ DW_TAG_array_type ]
!142 = metadata !{metadata !143}
!143 = metadata !{i32 786465, i64 0, i64 35}      ; [ DW_TAG_subrange_type ]
!144 = metadata !{i32 208, i32 52, metadata !137, null}
!145 = metadata !{i32 786689, metadata !146, metadata !"yFinish", metadata !9, i32 83886268, metadata !12, i32 0, metadata !149} ; [ DW_TAG_arg_variable ]
!146 = metadata !{i32 786478, i32 0, metadata !9, metadata !"manhattanHeuristic", metadata !"manhattanHeuristic", metadata !"_Z18manhattanHeuristiciiiii", metadata !9, i32 188, metadata !147, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !13, i32 188} ; [ DW_TAG_subprogram ]
!147 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !148, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!148 = metadata !{null, metadata !12, metadata !12, metadata !12, metadata !12, metadata !12}
!149 = metadata !{i32 229, i32 4, metadata !150, null}
!150 = metadata !{i32 786443, metadata !151, i32 226, i32 77, metadata !9, i32 28} ; [ DW_TAG_lexical_block ]
!151 = metadata !{i32 786443, metadata !152, i32 225, i32 35, metadata !9, i32 27} ; [ DW_TAG_lexical_block ]
!152 = metadata !{i32 786443, metadata !153, i32 225, i32 7, metadata !9, i32 26} ; [ DW_TAG_lexical_block ]
!153 = metadata !{i32 786443, metadata !137, i32 208, i32 77, metadata !9, i32 25} ; [ DW_TAG_lexical_block ]
!154 = metadata !{i32 188, i32 70, metadata !146, metadata !149}
!155 = metadata !{i32 786689, metadata !146, metadata !"yFinish", metadata !9, i32 83886268, metadata !12, i32 0, metadata !156} ; [ DW_TAG_arg_variable ]
!156 = metadata !{i32 250, i32 5, metadata !157, null}
!157 = metadata !{i32 786443, metadata !158, i32 247, i32 77, metadata !9, i32 32} ; [ DW_TAG_lexical_block ]
!158 = metadata !{i32 786443, metadata !159, i32 246, i32 36, metadata !9, i32 31} ; [ DW_TAG_lexical_block ]
!159 = metadata !{i32 786443, metadata !160, i32 246, i32 8, metadata !9, i32 30} ; [ DW_TAG_lexical_block ]
!160 = metadata !{i32 786443, metadata !153, i32 244, i32 4, metadata !9, i32 29} ; [ DW_TAG_lexical_block ]
!161 = metadata !{i32 188, i32 70, metadata !146, metadata !156}
!162 = metadata !{i32 786689, metadata !137, metadata !"xFinish", metadata !9, i32 50331856, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!163 = metadata !{i32 208, i32 39, metadata !137, null}
!164 = metadata !{i32 786689, metadata !146, metadata !"xFinish", metadata !9, i32 67109052, metadata !12, i32 0, metadata !149} ; [ DW_TAG_arg_variable ]
!165 = metadata !{i32 188, i32 57, metadata !146, metadata !149}
!166 = metadata !{i32 786689, metadata !146, metadata !"xFinish", metadata !9, i32 67109052, metadata !12, i32 0, metadata !156} ; [ DW_TAG_arg_variable ]
!167 = metadata !{i32 188, i32 57, metadata !146, metadata !156}
!168 = metadata !{i32 786689, metadata !137, metadata !"yStart", metadata !9, i32 33554640, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!169 = metadata !{i32 208, i32 27, metadata !137, null}
!170 = metadata !{i32 786689, metadata !171, metadata !"yFather", metadata !9, i32 50331678, metadata !12, i32 0, metadata !174} ; [ DW_TAG_arg_variable ]
!171 = metadata !{i32 786478, i32 0, metadata !9, metadata !"calculateFather", metadata !"calculateFather", metadata !"_Z15calculateFatheriii", metadata !9, i32 30, metadata !172, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !13, i32 30} ; [ DW_TAG_subprogram ]
!172 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !173, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!173 = metadata !{null, metadata !12, metadata !12, metadata !12}
!174 = metadata !{i32 228, i32 4, metadata !150, null}
!175 = metadata !{i32 30, i32 53, metadata !171, metadata !174}
!176 = metadata !{i32 786689, metadata !137, metadata !"xStart", metadata !9, i32 16777424, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!177 = metadata !{i32 208, i32 15, metadata !137, null}
!178 = metadata !{i32 786689, metadata !171, metadata !"xFather", metadata !9, i32 33554462, metadata !12, i32 0, metadata !174} ; [ DW_TAG_arg_variable ]
!179 = metadata !{i32 30, i32 40, metadata !171, metadata !174}
!180 = metadata !{i32 786689, metadata !137, metadata !"map", null, i32 208, metadata !181, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!181 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 73728, i64 32, i32 0, i32 0, metadata !12, metadata !182, i32 0, i32 0} ; [ DW_TAG_array_type ]
!182 = metadata !{metadata !183, metadata !143}
!183 = metadata !{i32 786465, i64 0, i64 63}      ; [ DW_TAG_subrange_type ]
!184 = metadata !{i32 208, i32 65, metadata !137, null}
!185 = metadata !{i32 786689, metadata !186, metadata !"map", null, i32 9, metadata !181, i32 0, metadata !189} ; [ DW_TAG_arg_variable ]
!186 = metadata !{i32 786478, i32 0, metadata !9, metadata !"initNodes", metadata !"initNodes", metadata !"_Z9initNodesiiPA36_i", metadata !9, i32 9, metadata !187, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !13, i32 9} ; [ DW_TAG_subprogram ]
!187 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !188, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!188 = metadata !{null, metadata !12, metadata !12, metadata !140}
!189 = metadata !{i32 211, i32 2, metadata !153, null}
!190 = metadata !{i32 9, i32 50, metadata !186, metadata !189}
!191 = metadata !{i32 14, i32 29, metadata !192, metadata !189}
!192 = metadata !{i32 786443, metadata !193, i32 14, i32 15, metadata !9, i32 1} ; [ DW_TAG_lexical_block ]
!193 = metadata !{i32 786443, metadata !186, i32 9, i32 62, metadata !9, i32 0} ; [ DW_TAG_lexical_block ]
!194 = metadata !{i32 14, i32 41, metadata !192, metadata !189}
!195 = metadata !{i32 14, i32 47, metadata !196, metadata !189}
!196 = metadata !{i32 786443, metadata !192, i32 14, i32 46, metadata !9, i32 2} ; [ DW_TAG_lexical_block ]
!197 = metadata !{i32 15, i32 3, metadata !196, metadata !189}
!198 = metadata !{i32 786688, metadata !193, metadata !"x", metadata !9, i32 11, metadata !12, i32 0, metadata !189} ; [ DW_TAG_auto_variable ]
!199 = metadata !{i32 17, i32 3, metadata !196, metadata !189}
!200 = metadata !{i32 18, i32 3, metadata !196, metadata !189}
!201 = metadata !{i32 18, i32 21, metadata !196, metadata !189}
!202 = metadata !{i32 786688, metadata !193, metadata !"y", metadata !9, i32 12, metadata !12, i32 0, metadata !189} ; [ DW_TAG_auto_variable ]
!203 = metadata !{i32 20, i32 3, metadata !196, metadata !189}
!204 = metadata !{i32 21, i32 4, metadata !205, metadata !189}
!205 = metadata !{i32 786443, metadata !196, i32 20, i32 19, metadata !9, i32 3} ; [ DW_TAG_lexical_block ]
!206 = metadata !{i32 22, i32 4, metadata !205, metadata !189}
!207 = metadata !{i32 23, i32 4, metadata !205, metadata !189}
!208 = metadata !{i32 24, i32 3, metadata !205, metadata !189}
!209 = metadata !{i32 25, i32 4, metadata !210, metadata !189}
!210 = metadata !{i32 786443, metadata !196, i32 24, i32 8, metadata !9, i32 4} ; [ DW_TAG_lexical_block ]
!211 = metadata !{i32 786688, metadata !192, metadata !"i", metadata !9, i32 14, metadata !12, i32 0, metadata !189} ; [ DW_TAG_auto_variable ]
!212 = metadata !{i32 214, i32 35, metadata !153, null}
!213 = metadata !{i32 786688, metadata !153, metadata !"position", metadata !9, i32 214, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!214 = metadata !{i32 215, i32 3, metadata !153, null}
!215 = metadata !{i32 216, i32 2, metadata !153, null}
!216 = metadata !{i32 217, i32 3, metadata !153, null}
!217 = metadata !{i32 218, i32 2, metadata !153, null}
!218 = metadata !{i32 219, i32 2, metadata !153, null}
!219 = metadata !{i32 222, i32 2, metadata !153, null}
!220 = metadata !{i32 225, i32 21, metadata !152, null}
!221 = metadata !{i32 225, i32 30, metadata !152, null}
!222 = metadata !{i32 225, i32 36, metadata !151, null}
!223 = metadata !{i32 226, i32 3, metadata !151, null}
!224 = metadata !{i32 786689, metadata !225, metadata !"position", metadata !9, i32 16777251, metadata !12, i32 0, metadata !228} ; [ DW_TAG_arg_variable ]
!225 = metadata !{i32 786478, i32 0, metadata !9, metadata !"openNode", metadata !"openNode", metadata !"_Z8openNodei", metadata !9, i32 35, metadata !226, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !13, i32 35} ; [ DW_TAG_subprogram ]
!226 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !227, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!227 = metadata !{null, metadata !12}
!228 = metadata !{i32 227, i32 4, metadata !150, null}
!229 = metadata !{i32 35, i32 19, metadata !225, metadata !228}
!230 = metadata !{i32 36, i32 2, metadata !231, metadata !228}
!231 = metadata !{i32 786443, metadata !225, i32 35, i32 28, metadata !9, i32 6} ; [ DW_TAG_lexical_block ]
!232 = metadata !{i32 786689, metadata !171, metadata !"position", metadata !9, i32 16777246, metadata !12, i32 0, metadata !174} ; [ DW_TAG_arg_variable ]
!233 = metadata !{i32 30, i32 26, metadata !171, metadata !174}
!234 = metadata !{i32 786688, metadata !235, metadata !"positionFather", metadata !9, i32 31, metadata !12, i32 0, metadata !174} ; [ DW_TAG_auto_variable ]
!235 = metadata !{i32 786443, metadata !171, i32 30, i32 61, metadata !9, i32 5} ; [ DW_TAG_lexical_block ]
!236 = metadata !{i32 31, i32 43, metadata !235, metadata !174}
!237 = metadata !{i32 32, i32 2, metadata !235, metadata !174}
!238 = metadata !{i32 786689, metadata !146, metadata !"x", metadata !9, i32 16777404, metadata !12, i32 0, metadata !149} ; [ DW_TAG_arg_variable ]
!239 = metadata !{i32 188, i32 29, metadata !146, metadata !149}
!240 = metadata !{i32 786689, metadata !146, metadata !"y", metadata !9, i32 33554620, metadata !12, i32 0, metadata !149} ; [ DW_TAG_arg_variable ]
!241 = metadata !{i32 188, i32 36, metadata !146, metadata !149}
!242 = metadata !{i32 786689, metadata !146, metadata !"position", metadata !9, i32 50331836, metadata !12, i32 0, metadata !149} ; [ DW_TAG_arg_variable ]
!243 = metadata !{i32 188, i32 43, metadata !146, metadata !149}
!244 = metadata !{i32 190, i32 2, metadata !245, metadata !149}
!245 = metadata !{i32 786443, metadata !146, i32 188, i32 78, metadata !9, i32 20} ; [ DW_TAG_lexical_block ]
!246 = metadata !{i32 786688, metadata !245, metadata !"xDistance", metadata !9, i32 189, metadata !12, i32 0, metadata !149} ; [ DW_TAG_auto_variable ]
!247 = metadata !{i32 191, i32 2, metadata !245, metadata !149}
!248 = metadata !{i32 786688, metadata !245, metadata !"yDistance", metadata !9, i32 189, metadata !12, i32 0, metadata !149} ; [ DW_TAG_auto_variable ]
!249 = metadata !{i32 193, i32 44, metadata !245, metadata !149}
!250 = metadata !{i32 230, i32 4, metadata !150, null}
!251 = metadata !{i32 786689, metadata !252, metadata !"position", metadata !9, i32 16777420, metadata !12, i32 0, metadata !253} ; [ DW_TAG_arg_variable ]
!252 = metadata !{i32 786478, i32 0, metadata !9, metadata !"costPlusHeuristic", metadata !"costPlusHeuristic", metadata !"_Z17costPlusHeuristici", metadata !9, i32 204, metadata !226, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !13, i32 204} ; [ DW_TAG_subprogram ]
!253 = metadata !{i32 231, i32 4, metadata !150, null}
!254 = metadata !{i32 204, i32 28, metadata !252, metadata !253}
!255 = metadata !{i32 205, i32 2, metadata !256, metadata !253}
!256 = metadata !{i32 786443, metadata !252, i32 204, i32 37, metadata !9, i32 24} ; [ DW_TAG_lexical_block ]
!257 = metadata !{i32 232, i32 3, metadata !150, null}
!258 = metadata !{i32 786688, metadata !152, metadata !"i", metadata !9, i32 225, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!259 = metadata !{i32 180, i32 5, metadata !260, metadata !268}
!260 = metadata !{i32 786443, metadata !261, i32 178, i32 48, metadata !9, i32 19} ; [ DW_TAG_lexical_block ]
!261 = metadata !{i32 786443, metadata !262, i32 177, i32 22, metadata !9, i32 18} ; [ DW_TAG_lexical_block ]
!262 = metadata !{i32 786443, metadata !263, i32 176, i32 59, metadata !9, i32 17} ; [ DW_TAG_lexical_block ]
!263 = metadata !{i32 786443, metadata !264, i32 176, i32 25, metadata !9, i32 16} ; [ DW_TAG_lexical_block ]
!264 = metadata !{i32 786443, metadata !265, i32 172, i32 26, metadata !9, i32 15} ; [ DW_TAG_lexical_block ]
!265 = metadata !{i32 786478, i32 0, metadata !9, metadata !"calculateBestOption", metadata !"calculateBestOption", metadata !"_Z19calculateBestOptionv", metadata !9, i32 172, metadata !266, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !13, i32 172} ; [ DW_TAG_subprogram ]
!266 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !267, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!267 = metadata !{metadata !12}
!268 = metadata !{i32 236, i32 13, metadata !153, null}
!269 = metadata !{i32 786688, metadata !264, metadata !"positionBestOption", metadata !9, i32 174, metadata !12, i32 0, metadata !268} ; [ DW_TAG_auto_variable ]
!270 = metadata !{i32 176, i32 39, metadata !263, metadata !268}
!271 = metadata !{i32 176, i32 54, metadata !263, metadata !268}
!272 = metadata !{i32 176, i32 60, metadata !262, metadata !268}
!273 = metadata !{i32 177, i32 3, metadata !262, metadata !268}
!274 = metadata !{i32 178, i32 4, metadata !261, metadata !268}
!275 = metadata !{i32 786688, metadata !264, metadata !"bestOption", metadata !9, i32 173, metadata !12, i32 0, metadata !268} ; [ DW_TAG_auto_variable ]
!276 = metadata !{i32 179, i32 5, metadata !260, metadata !268}
!277 = metadata !{i32 786688, metadata !263, metadata !"i", metadata !9, i32 176, metadata !12, i32 0, metadata !268} ; [ DW_TAG_auto_variable ]
!278 = metadata !{i32 786689, metadata !279, metadata !"position", metadata !9, i32 16777255, metadata !12, i32 0, metadata !280} ; [ DW_TAG_arg_variable ]
!279 = metadata !{i32 786478, i32 0, metadata !9, metadata !"closeNode", metadata !"closeNode", metadata !"_Z9closeNodei", metadata !9, i32 39, metadata !226, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !13, i32 39} ; [ DW_TAG_subprogram ]
!280 = metadata !{i32 238, i32 2, metadata !153, null}
!281 = metadata !{i32 39, i32 20, metadata !279, metadata !280}
!282 = metadata !{i32 40, i32 2, metadata !283, metadata !280}
!283 = metadata !{i32 786443, metadata !279, i32 39, i32 29, metadata !9, i32 7} ; [ DW_TAG_lexical_block ]
!284 = metadata !{i32 41, i32 2, metadata !283, metadata !280}
!285 = metadata !{i32 241, i32 42, metadata !153, null}
!286 = metadata !{i32 786688, metadata !153, metadata !"finalPosition", metadata !9, i32 241, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!287 = metadata !{i32 244, i32 2, metadata !153, null}
!288 = metadata !{i32 245, i32 3, metadata !160, null}
!289 = metadata !{i32 246, i32 22, metadata !159, null}
!290 = metadata !{i32 246, i32 31, metadata !159, null}
!291 = metadata !{i32 246, i32 37, metadata !158, null}
!292 = metadata !{i32 247, i32 4, metadata !158, null}
!293 = metadata !{i32 786689, metadata !225, metadata !"position", metadata !9, i32 16777251, metadata !12, i32 0, metadata !294} ; [ DW_TAG_arg_variable ]
!294 = metadata !{i32 248, i32 5, metadata !157, null}
!295 = metadata !{i32 35, i32 19, metadata !225, metadata !294}
!296 = metadata !{i32 36, i32 2, metadata !231, metadata !294}
!297 = metadata !{i32 249, i32 5, metadata !157, null}
!298 = metadata !{i32 786689, metadata !171, metadata !"position", metadata !9, i32 16777246, metadata !12, i32 0, metadata !297} ; [ DW_TAG_arg_variable ]
!299 = metadata !{i32 30, i32 26, metadata !171, metadata !297}
!300 = metadata !{i32 786689, metadata !171, metadata !"yFather", metadata !9, i32 50331678, metadata !12, i32 0, metadata !297} ; [ DW_TAG_arg_variable ]
!301 = metadata !{i32 30, i32 53, metadata !171, metadata !297}
!302 = metadata !{i32 31, i32 43, metadata !235, metadata !297}
!303 = metadata !{i32 786688, metadata !235, metadata !"positionFather", metadata !9, i32 31, metadata !12, i32 0, metadata !297} ; [ DW_TAG_auto_variable ]
!304 = metadata !{i32 32, i32 2, metadata !235, metadata !297}
!305 = metadata !{i32 786689, metadata !146, metadata !"x", metadata !9, i32 16777404, metadata !12, i32 0, metadata !156} ; [ DW_TAG_arg_variable ]
!306 = metadata !{i32 188, i32 29, metadata !146, metadata !156}
!307 = metadata !{i32 786689, metadata !146, metadata !"y", metadata !9, i32 33554620, metadata !12, i32 0, metadata !156} ; [ DW_TAG_arg_variable ]
!308 = metadata !{i32 188, i32 36, metadata !146, metadata !156}
!309 = metadata !{i32 786689, metadata !146, metadata !"position", metadata !9, i32 50331836, metadata !12, i32 0, metadata !156} ; [ DW_TAG_arg_variable ]
!310 = metadata !{i32 188, i32 43, metadata !146, metadata !156}
!311 = metadata !{i32 190, i32 2, metadata !245, metadata !156}
!312 = metadata !{i32 786688, metadata !245, metadata !"xDistance", metadata !9, i32 189, metadata !12, i32 0, metadata !156} ; [ DW_TAG_auto_variable ]
!313 = metadata !{i32 191, i32 2, metadata !245, metadata !156}
!314 = metadata !{i32 786688, metadata !245, metadata !"yDistance", metadata !9, i32 189, metadata !12, i32 0, metadata !156} ; [ DW_TAG_auto_variable ]
!315 = metadata !{i32 193, i32 44, metadata !245, metadata !156}
!316 = metadata !{i32 251, i32 5, metadata !157, null}
!317 = metadata !{i32 786689, metadata !252, metadata !"position", metadata !9, i32 16777420, metadata !12, i32 0, metadata !318} ; [ DW_TAG_arg_variable ]
!318 = metadata !{i32 252, i32 5, metadata !157, null}
!319 = metadata !{i32 204, i32 28, metadata !252, metadata !318}
!320 = metadata !{i32 205, i32 2, metadata !256, metadata !318}
!321 = metadata !{i32 253, i32 4, metadata !157, null}
!322 = metadata !{i32 786688, metadata !159, metadata !"i", metadata !9, i32 246, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!323 = metadata !{i32 180, i32 5, metadata !260, metadata !324}
!324 = metadata !{i32 258, i32 14, metadata !160, null}
!325 = metadata !{i32 786688, metadata !264, metadata !"positionBestOption", metadata !9, i32 174, metadata !12, i32 0, metadata !324} ; [ DW_TAG_auto_variable ]
!326 = metadata !{i32 176, i32 39, metadata !263, metadata !324}
!327 = metadata !{i32 176, i32 54, metadata !263, metadata !324}
!328 = metadata !{i32 176, i32 60, metadata !262, metadata !324}
!329 = metadata !{i32 177, i32 3, metadata !262, metadata !324}
!330 = metadata !{i32 178, i32 4, metadata !261, metadata !324}
!331 = metadata !{i32 786688, metadata !264, metadata !"bestOption", metadata !9, i32 173, metadata !12, i32 0, metadata !324} ; [ DW_TAG_auto_variable ]
!332 = metadata !{i32 179, i32 5, metadata !260, metadata !324}
!333 = metadata !{i32 786688, metadata !263, metadata !"i", metadata !9, i32 176, metadata !12, i32 0, metadata !324} ; [ DW_TAG_auto_variable ]
!334 = metadata !{i32 786689, metadata !279, metadata !"position", metadata !9, i32 16777255, metadata !12, i32 0, metadata !335} ; [ DW_TAG_arg_variable ]
!335 = metadata !{i32 260, i32 3, metadata !160, null}
!336 = metadata !{i32 39, i32 20, metadata !279, metadata !335}
!337 = metadata !{i32 40, i32 2, metadata !283, metadata !335}
!338 = metadata !{i32 41, i32 2, metadata !283, metadata !335}
!339 = metadata !{i32 261, i32 2, metadata !160, null}
!340 = metadata !{i32 264, i32 2, metadata !153, null}
!341 = metadata !{i32 265, i32 3, metadata !342, null}
!342 = metadata !{i32 786443, metadata !153, i32 264, i32 34, metadata !9, i32 34} ; [ DW_TAG_lexical_block ]
!343 = metadata !{i32 266, i32 3, metadata !342, null}
!344 = metadata !{i32 267, i32 2, metadata !342, null}
!345 = metadata !{i32 269, i32 2, metadata !153, null}
!346 = metadata !{i32 271, i32 2, metadata !153, null}
