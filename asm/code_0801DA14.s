	.include "macro.inc"

	.syntax unified

	thumb_func_start SendToConvoyMenu_Selected
SendToConvoyMenu_Selected: @ 0x0801DA14
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0801DA68 @ =0x03004690
	ldr r2, [r0]
	adds r5, r1, #0
	adds r5, #0x3c
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #1
	adds r2, #0x1e
	adds r2, r2, r0
	ldrh r4, [r2]
	ldr r1, _0801DA6C @ =0x0203A85C
	strh r4, [r1, #6]
	movs r0, #0
	ldrsb r0, [r5, r0]
	strh r0, [r1, #8]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	movs r0, #2
	bl SetTalkChoiceResult
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0801DA74
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r1, r1, #4
	adds r1, #0x20
	ldr r2, _0801DA70 @ =0x00000762
	movs r0, #8
	adds r3, r6, #0
	bl StartBoxDialogueSimple
	b _0801DA86
	.align 2, 0
_0801DA68: .4byte 0x03004690
_0801DA6C: .4byte 0x0203A85C
_0801DA70: .4byte 0x00000762
_0801DA74:
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r1, r1, #4
	adds r1, #0x20
	ldr r2, _0801DA90 @ =0x00000761
	movs r0, #8
	adds r3, r6, #0
	bl StartBoxDialogueSimple
_0801DA86:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801DA90: .4byte 0x00000761
