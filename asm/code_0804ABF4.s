	.include "macro.inc"

	.syntax unified

	thumb_func_start SetForceDisabledMenuItems
SetForceDisabledMenuItems: @ 0x0804ABF4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0804ABFA:
	adds r1, r5, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804AC0A
	movs r1, #1
	ldr r2, _0804AC18 @ =MenuAlwaysNotShown
	bl SetMenuOverride
_0804AC0A:
	adds r4, #1
	cmp r4, #0xf
	ble _0804ABFA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804AC18: .4byte MenuAlwaysNotShown
