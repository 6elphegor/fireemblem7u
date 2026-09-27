	.include "macro.inc"

	.syntax unified

	thumb_func_start SetupUnitStatusStaffAIFlags
SetupUnitStatusStaffAIFlags: @ 0x08037218
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0803725A
	movs r4, #2
	adds r0, r5, #0
	bl GetItemIndex
	cmp r0, #0x51
	beq _0803724E
	cmp r0, #0x51
	bgt _08037244
	cmp r0, #0x50
	beq _0803724A
	b _08037254
_08037244:
	cmp r0, #0x52
	beq _08037252
	b _08037254
_0803724A:
	movs r4, #8
	b _08037254
_0803724E:
	movs r4, #0x10
	b _08037254
_08037252:
	movs r4, #0x20
_08037254:
	ldrb r0, [r6, #0xa]
	orrs r4, r0
	strb r4, [r6, #0xa]
_0803725A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
