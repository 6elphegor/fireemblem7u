	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7DAC
sub_080B7DAC: @ 0x080B7DAC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r6, _080B7E18 @ =0x03002870
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r4, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bl ApplySystemObjectsGraphics
	movs r0, #1
	ldrb r1, [r6, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	strb r0, [r6, #1]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl InitBoxDialogue
	movs r1, #4
	rsbs r1, r1, #0
	ldr r2, _080B7E1C @ =0x000009F5
	movs r0, #0
	adds r3, r5, #0
	bl StartBoxDialogueSimple
	movs r0, #0xc8
	lsls r0, r0, #1
	bl SetDialogueBoxConfig
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7E18: .4byte 0x03002870
_080B7E1C: .4byte 0x000009F5
