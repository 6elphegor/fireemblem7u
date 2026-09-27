	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047BD4
sub_08047BD4: @ 0x08047BD4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _08047C30 @ =0x02024460
	ldr r0, _08047C34 @ =0x08CC1C5C
	bl Proc_EndEach
	movs r0, #0x14
	subs r0, r0, r5
	lsls r0, r0, #5
	cmp r0, #0
	ble _08047C02
	movs r1, #0xe0
	lsls r1, r1, #8
	adds r2, r1, #0
	adds r1, r0, #0
_08047BF4:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _08047BF4
_08047C02:
	lsls r0, r5, #5
	ldr r3, _08047C34 @ =0x08CC1C5C
	cmp r0, #0
	ble _08047C20
	movs r5, #0xf0
	lsls r5, r5, #8
	adds r2, r5, #0
	adds r1, r0, #0
_08047C12:
	ldrh r5, [r4]
	adds r0, r2, r5
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _08047C12
_08047C20:
	adds r0, r3, #0
	adds r1, r6, #0
	bl Proc_Start
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047C30: .4byte 0x02024460
_08047C34: .4byte 0x08CC1C5C
