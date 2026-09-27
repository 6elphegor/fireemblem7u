	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08056404
sub_08056404: @ 0x08056404
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805642A
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	b _08056452
_0805642A:
	cmp r0, #0xa
	bne _08056452
	adds r0, r4, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08056448
	movs r0, #2
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
_08056448:
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_08056452:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
