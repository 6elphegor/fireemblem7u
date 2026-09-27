	.include "macro.inc"

	.syntax unified

	thumb_func_start OverriddenMenuAvailability
OverriddenMenuAvailability: @ 0x0804AC4C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _0804AC54 @ =0x03001458
	b _0804AC76
	.align 2, 0
_0804AC54: .4byte 0x03001458
_0804AC58:
	cmp r3, #1
	bne _0804AC74
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldrb r5, [r4, #9]
	cmp r0, r5
	bne _0804AC74
	ldr r2, [r2, #4]
	adds r0, r4, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0804AC82
_0804AC74:
	adds r2, #8
_0804AC76:
	ldrh r3, [r2, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bne _0804AC58
	movs r0, #0
_0804AC82:
	pop {r4, r5}
	pop {r1}
	bx r1
