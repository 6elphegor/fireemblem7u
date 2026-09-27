	.include "macro.inc"

	.syntax unified

	thumb_func_start StaffCommandUsability
StaffCommandUsability: @ 0x0802290C
	push {r4, r5, r6, lr}
	ldr r0, _08022920 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022928
	b _08022976
	.align 2, 0
_08022920: .4byte 0x03004690
_08022924:
	movs r0, #2
	b _08022978
_08022928:
	movs r6, #0
	ldrh r4, [r2, #0x1e]
	cmp r4, #0
	beq _08022976
_08022930:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	bne _08022960
	ldr r5, _0802295C @ =0x03004690
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022960
	ldr r0, [r5]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022924
	movs r0, #1
	b _08022978
	.align 2, 0
_0802295C: .4byte 0x03004690
_08022960:
	adds r6, #1
	cmp r6, #4
	bgt _08022976
	ldr r0, _08022980 @ =0x03004690
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08022930
_08022976:
	movs r0, #3
_08022978:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022980: .4byte 0x03004690
