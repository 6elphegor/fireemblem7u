	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMapSelect
StartMapSelect: @ 0x0804AE88
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl LockGame
	ldr r0, _0804AEE8 @ =0x08B9A92C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x34
	movs r6, #0
	movs r0, #1
	strb r0, [r1]
	str r4, [r5, #0x2c]
	bl GetLinkedTargets
	str r0, [r5, #0x30]
	str r6, [r5, #0x38]
	ldr r0, [r5, #0x2c]
	ldr r1, [r0]
	cmp r1, #0
	beq _0804AEBC
	adds r0, r5, #0
	bl _call_via_r1
_0804AEBC:
	ldr r0, [r5, #0x2c]
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0804AECA
	adds r0, r5, #0
	bl _call_via_r1
_0804AECA:
	ldr r0, [r5, #0x2c]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	beq _0804AEDA
	ldr r1, [r5, #0x30]
	adds r0, r5, #0
	bl _call_via_r2
_0804AEDA:
	ldr r0, _0804AEEC @ =0x08B857F8
	ldr r0, [r0]
	strh r6, [r0, #8]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804AEE8: .4byte 0x08B9A92C
_0804AEEC: .4byte 0x08B857F8
