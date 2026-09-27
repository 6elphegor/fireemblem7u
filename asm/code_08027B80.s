	.include "macro.inc"

	.syntax unified

	thumb_func_start RepairMenuItemIsAvailable
RepairMenuItemIsAvailable: @ 0x08027B80
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, _08027B9C @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	lsls r4, r4, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _08027BA0
	movs r0, #3
	b _08027BB0
	.align 2, 0
_08027B9C: .4byte 0x0203A85C
_08027BA0:
	bl IsItemRepairable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027BAE
	movs r0, #1
	b _08027BB0
_08027BAE:
	movs r0, #2
_08027BB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
