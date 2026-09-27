	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepCheckCanSelectUnit
PrepCheckCanSelectUnit: @ 0x080935A4
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r1, r4, #0
	adds r1, #0x2a
	adds r3, r4, #0
	adds r3, #0x29
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r1, r0
	bls _080935F8
	adds r0, #1
	strb r0, [r3]
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl RegisterSioPid
	ldr r0, _080935F0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080935E2
	ldr r0, _080935F4 @ =0x0000038A
	bl m4aSongNumStart
_080935E2:
	ldrh r0, [r4, #0x2e]
	lsrs r1, r0, #1
	adds r0, r4, #0
	bl PrepUnit_DrawUnitListNames
	movs r0, #1
	b _0809360E
	.align 2, 0
_080935F0: .4byte 0x0202BBF8
_080935F4: .4byte 0x0000038A
_080935F8:
	ldr r0, _08093614 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809360C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0809360C:
	movs r0, #0
_0809360E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093614: .4byte 0x0202BBF8
