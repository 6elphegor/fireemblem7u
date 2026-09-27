	.include "macro.inc"

	.syntax unified

	thumb_func_start StealItemMenuCommand_Usability
StealItemMenuCommand_Usability: @ 0x080230E8
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r5, _08023104 @ =0x0203A85C
	ldrb r0, [r5, #0xd]
	bl GetUnit
	lsls r4, r4, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _08023108
	movs r0, #3
	b _08023124
	.align 2, 0
_08023104: .4byte 0x0203A85C
_08023108:
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	bl IsItemStealable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023122
	movs r0, #1
	b _08023124
_08023122:
	movs r0, #2
_08023124:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
