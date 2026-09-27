	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021FB4
sub_08021FB4: @ 0x08021FB4
	push {r4, r5, r6, lr}
	ldr r6, _08021FD8 @ =0x03004690
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022012
	adds r0, r2, #0
	bl MakeTargetListForRefresh
	bl CountTargets
	cmp r0, #0
	beq _08021FDC
_08021FD2:
	movs r0, #1
	b _08022014
	.align 2, 0
_08021FD8: .4byte 0x03004690
_08021FDC:
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _08022012
_08021FE6:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _08021FFE
	ldr r0, [r6]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08021FD2
_08021FFE:
	adds r5, #1
	cmp r5, #4
	bgt _08022012
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08021FE6
_08022012:
	movs r0, #3
_08022014:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
