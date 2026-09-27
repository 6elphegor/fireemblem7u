	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08052C50
sub_08052C50: @ 0x08052C50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r2, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08052C76
	movs r0, #0
	strh r0, [r4]
_08052C76:
	ldr r0, _08052C98 @ =0x0203E00C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r5
	beq _08052C90
	cmp r2, #0x53
	blt _08052C90
	cmp r2, #0x55
	ble _08052C8C
	cmp r2, #0x57
	bne _08052C90
_08052C8C:
	movs r0, #0
	strh r0, [r4]
_08052C90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052C98: .4byte 0x0203E00C
