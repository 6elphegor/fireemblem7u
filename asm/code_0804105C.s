	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804105C
sub_0804105C: @ 0x0804105C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804107C
	ldr r0, _080410F0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804107C
	movs r0, #0x7c
	bl m4aSongNumStart
_0804107C:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	movs r6, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _08041092
	strh r6, [r1]
_08041092:
	ldr r0, _080410F4 @ =0x0203DC24
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r1, r0
	ble _080410A6
	bl StartSioErrorScreen
_080410A6:
	ldr r0, _080410F8 @ =0x0300479C
	movs r1, #0xd9
	strb r1, [r0]
	ldr r4, _080410FC @ =0x08B98AEC
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r6, [r0, #2]
	movs r1, #4
	bl SioSend
	ldr r4, [r4]
	ldr r1, [r5, #0x58]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r4, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r1, [r4, #9]
	ldrb r2, [r0]
	cmp r2, r1
	bne _080410E8
	ldrb r0, [r4, #0xa]
	ands r0, r1
	cmp r0, r2
	bne _080410E8
	ldr r0, _08041100 @ =0x08B98BAC
	bl Proc_EndEach
	adds r0, r5, #0
	bl Proc_Break
_080410E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080410F0: .4byte 0x0202BBF8
_080410F4: .4byte 0x0203DC24
_080410F8: .4byte 0x0300479C
_080410FC: .4byte 0x08B98AEC
_08041100: .4byte 0x08B98BAC
