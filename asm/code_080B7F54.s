	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7F54
sub_080B7F54: @ 0x080B7F54
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _080B7F9C @ =0x08CEE15C
	ldr r4, [r0]
	adds r0, r5, #0
	bl sub_080B7ED4
	adds r6, r0, #0
	cmp r6, #4
	bne _080B7F78
	movs r0, #0x7d
	bl CheckChapterFlag
	lsls r0, r0, #0x18
	movs r5, #0xf
	cmp r0, #0
	beq _080B7F78
	movs r5, #0x15
_080B7F78:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl GetPidStats
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x1a
	movs r0, #0
	strb r0, [r4]
	cmp r6, #5
	bls _080B7F90
	b _080B80B8
_080B7F90:
	lsls r0, r6, #2
	ldr r1, _080B7FA0 @ =_080B7FA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B7F9C: .4byte 0x08CEE15C
_080B7FA0: .4byte _080B7FA4
_080B7FA4: @ jump table
	.4byte _080B7FBC @ case 0
	.4byte _080B7FE0 @ case 1
	.4byte _080B8004 @ case 2
	.4byte _080B8028 @ case 3
	.4byte _080B8078 @ case 4
	.4byte _080B80B4 @ case 5
_080B7FBC:
	ldr r0, _080B7FD8 @ =0x00001019
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080B7EF8
	adds r4, r0, #0
	ldr r0, _080B7FDC @ =0x085E9AD0
	b _080B80A2
	.align 2, 0
_080B7FD8: .4byte 0x00001019
_080B7FDC: .4byte 0x085E9AD0
_080B7FE0:
	ldr r0, _080B7FFC @ =0x0000101A
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080B7EF8
	adds r4, r0, #0
	ldr r0, _080B8000 @ =0x0000101B
	b _080B809E
	.align 2, 0
_080B7FFC: .4byte 0x0000101A
_080B8000: .4byte 0x0000101B
_080B8004:
	ldr r0, _080B8020 @ =0x0000101A
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080B7EF8
	adds r4, r0, #0
	ldr r0, _080B8024 @ =0x0000101C
	b _080B809E
	.align 2, 0
_080B8020: .4byte 0x0000101A
_080B8024: .4byte 0x0000101C
_080B8028:
	adds r0, r7, #0
	subs r0, #0x1d
	cmp r0, #1
	bhi _080B8054
	ldr r0, _080B804C @ =0x0000101A
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080B7EF8
	adds r4, r0, #0
	ldr r0, _080B8050 @ =0x0000101C
	b _080B809E
	.align 2, 0
_080B804C: .4byte 0x0000101A
_080B8050: .4byte 0x0000101C
_080B8054:
	ldr r0, _080B8070 @ =0x00001019
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080B7EF8
	adds r4, r0, #0
	ldr r0, _080B8074 @ =0x085E9AD0
	b _080B80A2
	.align 2, 0
_080B8070: .4byte 0x00001019
_080B8074: .4byte 0x085E9AD0
_080B8078:
	cmp r5, #0x15
	bne _080B8084
	ldr r0, _080B8080 @ =0x00001091
	b _080B8086
	.align 2, 0
_080B8080: .4byte 0x00001091
_080B8084:
	ldr r0, _080B80AC @ =0x00001092
_080B8086:
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080B7EF8
	adds r4, r0, #0
	ldr r0, _080B80B0 @ =0x00001093
_080B809E:
	bl DecodeMsg
_080B80A2:
	adds r1, r4, #0
	bl AppendString
	b _080B80B8
	.align 2, 0
_080B80AC: .4byte 0x00001092
_080B80B0: .4byte 0x00001093
_080B80B4:
	movs r0, #0
	b _080B80BC
_080B80B8:
	ldr r0, _080B80C4 @ =0x08CEE15C
	ldr r0, [r0]
_080B80BC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B80C4: .4byte 0x08CEE15C
