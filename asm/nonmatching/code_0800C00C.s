	.include "macro.inc"

	.syntax unified

	thumb_func_start CanDisplayUnitMovement
CanDisplayUnitMovement: @ 0x0800C00C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800C03C
	ldr r0, _0800C04C @ =0x08B92E38
	bl Proc_Find
	cmp r0, #0
	bne _0800C050
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl EnsureCameraOntoPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800C050
_0800C03C:
	bl CanStartMu
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C050
	movs r0, #1
	b _0800C052
	.align 2, 0
_0800C04C: .4byte 0x08B92E38
_0800C050:
	movs r0, #0
_0800C052:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
