	.include "macro.inc"

	.syntax unified

	thumb_func_start StaffItemSelect_Usability
StaffItemSelect_Usability: @ 0x08022A44
	push {r4, r5, lr}
	ldr r5, _08022A70 @ =0x03004690
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	bne _08022A74
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022A74
	movs r0, #1
	b _08022A76
	.align 2, 0
_08022A70: .4byte 0x03004690
_08022A74:
	movs r0, #3
_08022A76:
	pop {r4, r5}
	pop {r1}
	bx r1
