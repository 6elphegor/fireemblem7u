	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801DA94
sub_0801DA94: @ 0x0801DA94
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _0801DADC @ =0x0202BBB8
	ldrh r4, [r0, #0x2c]
	ldr r1, _0801DAE0 @ =0x0203A85C
	strh r4, [r1, #6]
	movs r0, #5
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
	beq _0801DAE8
	adds r0, r5, #0
	adds r0, #0x3c
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	adds r1, #0x20
	ldr r2, _0801DAE4 @ =0x00000762
	movs r0, #8
	adds r3, r6, #0
	bl StartBoxDialogueSimple
	b _0801DAFE
	.align 2, 0
_0801DADC: .4byte 0x0202BBB8
_0801DAE0: .4byte 0x0203A85C
_0801DAE4: .4byte 0x00000762
_0801DAE8:
	adds r0, r5, #0
	adds r0, #0x3c
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	adds r1, #0x20
	ldr r2, _0801DB08 @ =0x00000761
	movs r0, #8
	adds r3, r6, #0
	bl StartBoxDialogueSimple
_0801DAFE:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801DB08: .4byte 0x00000761
