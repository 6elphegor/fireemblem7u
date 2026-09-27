	.include "macro.inc"

	.syntax unified

	thumb_func_start OverriddenMenuSelected
OverriddenMenuSelected: @ 0x0804AC88
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r2, _0804AC94 @ =0x03001458
	b _0804ACBA
	.align 2, 0
_0804AC94: .4byte 0x03001458
_0804AC98:
	cmp r1, #2
	bne _0804ACB8
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r3, #0x30]
	ldrb r0, [r0, #9]
	cmp r1, r0
	bne _0804ACB8
	ldr r2, [r2, #4]
	adds r0, r4, #0
	adds r1, r3, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0804ACC6
_0804ACB8:
	adds r2, #8
_0804ACBA:
	ldrh r1, [r2, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bne _0804AC98
	movs r0, #0xff
_0804ACC6:
	pop {r4, r5}
	pop {r1}
	bx r1
