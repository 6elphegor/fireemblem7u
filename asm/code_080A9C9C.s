	.include "macro.inc"

	.syntax unified

	thumb_func_start SysboxTextMain
SysboxTextMain: @ 0x080A9C9C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	bl SetTextFont
	adds r1, r4, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	cmp r0, #4
	bne _080A9CB4
	movs r0, #0
	strh r0, [r1]
_080A9CB4:
	ldrh r0, [r1]
	cmp r0, #0
	bne _080A9CF0
	ldr r1, [r4, #0x54]
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A9CD8
	cmp r0, #1
	beq _080A9CE0
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x44
	adds r0, r4, r0
	bl Text_DrawCharacter
	b _080A9CEE
_080A9CD8:
	adds r0, r4, #0
	bl Proc_Break
	b _080A9CF0
_080A9CE0:
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0x54]
	adds r0, #1
_080A9CEE:
	str r0, [r4, #0x54]
_080A9CF0:
	adds r1, r4, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
