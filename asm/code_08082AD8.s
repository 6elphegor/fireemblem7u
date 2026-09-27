	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxTextScroll_OnLoop
HelpBoxTextScroll_OnLoop: @ 0x08082AD8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08082B66
	adds r0, r4, #0
	adds r0, #0x60
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [r4, #0x30]
	bl SetTextFont
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x62
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r6, r1
	bge _08082B60
	adds r5, r4, #0
	adds r5, #0x5c
_08082B0E:
	ldr r0, [r4, #0x2c]
	ldrb r2, [r0]
	adds r3, r0, #0
	cmp r2, #1
	beq _08082B30
	cmp r2, #1
	bgt _08082B22
	cmp r2, #0
	beq _08082B28
	b _08082B40
_08082B22:
	cmp r2, #4
	beq _08082B3C
	b _08082B40
_08082B28:
	adds r0, r4, #0
	bl Proc_Break
	b _08082B60
_08082B30:
	adds r0, r3, #1
	str r0, [r4, #0x2c]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _08082B56
_08082B3C:
	adds r0, r3, #1
	b _08082B54
_08082B40:
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r3, #0
	bl Text_DrawCharacter
_08082B54:
	str r0, [r4, #0x2c]
_08082B56:
	adds r6, #1
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r6, r0
	blt _08082B0E
_08082B60:
	movs r0, #0
	bl SetTextFont
_08082B66:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
