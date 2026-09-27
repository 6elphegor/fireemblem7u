	.include "macro.inc"

	.syntax unified

	thumb_func_start Event_CgTalkOnSkip
Event_CgTalkOnSkip: @ 0x08010190
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080101B2
	bl EndCgText
	adds r0, r4, #0
	bl sub_0800AF20
	movs r0, #0
	str r0, [r4, #0x40]
	b _080101C6
_080101B2:
	bl CgTextExists
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _080101C6
	adds r0, r4, #0
	bl sub_0800AF20
	str r5, [r4, #0x40]
_080101C6:
	pop {r4, r5}
	pop {r0}
	bx r0
