	.include "macro.inc"

	.syntax unified

	thumb_func_start DoRescueDropAction
DoRescueDropAction: @ 0x0802F3A4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802F40C @ =0x0203A85C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, _0802F410 @ =0x0202E3F0
	ldr r1, [r0]
	ldrb r2, [r4, #0x14]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0x13]
	adds r1, r0, r1
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802F418
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl UnitSyncMovement
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #2
	adds r3, r6, #0
	bl Make6CKOIDO
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	bl UnitDrop
	ldr r0, _0802F414 @ =0x08B96310
	adds r1, r6, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x54]
	b _0802F426
	.align 2, 0
_0802F40C: .4byte 0x0203A85C
_0802F410: .4byte 0x0202E3F0
_0802F414: .4byte 0x08B96310
_0802F418:
	ldr r0, _0802F430 @ =0x02033E00
	movs r1, #0xa
	strb r1, [r0]
	movs r1, #4
	strb r1, [r0, #1]
	bl SetAutoMuMoveScript
_0802F426:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802F430: .4byte 0x02033E00
