	.include "macro.inc"

	.syntax unified

	thumb_func_start TactInfo_SetupGfx
TactInfo_SetupGfx: @ 0x080A68DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	movs r0, #0
	bl InitBgs
	bl ApplySystemObjectsGraphics
	ldr r7, _080A69B8 @ =0x03002870
	adds r6, r7, #0
	adds r6, #0x3c
	movs r4, #0x3f
	adds r0, r4, #0
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	movs r5, #0
	movs r0, #0x10
	ldr r2, _080A69BC @ =0x030028B4
	strb r0, [r2]
	movs r1, #0x45
	adds r1, r1, r7
	mov r8, r1
	strb r5, [r1]
	movs r2, #0x46
	adds r2, r2, r7
	mov sl, r2
	strb r5, [r2]
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r0, [r7, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r7, #0x10]
	movs r0, #3
	ldrb r1, [r7, #0x14]
	orrs r1, r0
	strb r1, [r7, #0x14]
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	ldrb r2, [r6]
	ands r4, r2
	strb r4, [r6]
	movs r1, #0x10
	ldr r0, _080A69BC @ =0x030028B4
	strb r1, [r0]
	mov r2, r8
	strb r5, [r2]
	mov r0, sl
	strb r5, [r0]
	ldr r0, _080A69C0 @ =0x0841629C
	ldr r1, _080A69C4 @ =0x06001000
	bl Decompress
	ldr r0, _080A69C8 @ =0x0841627C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A69CC @ =0x02023C60
	ldr r1, _080A69D0 @ =0x08418818
	ldr r2, _080A69D4 @ =0x0000F080
	bl TmApplyTsa_thm
	mov r0, sb
	bl StartUiCursorHand
	ldr r1, _080A69D8 @ =0x06008000
	movs r0, #0
	movs r2, #0xa
	movs r3, #1
	bl StartMuralBackgroundExt
	bl sub_080A6748
	ldr r0, _080A69DC @ =TactInfoFx_Thread
	mov r1, sb
	bl StartParallelWorker
	movs r0, #0xb4
	movs r1, #0x10
	mov r2, sb
	bl StartHelpPromptSprite
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A69B8: .4byte 0x03002870
_080A69BC: .4byte 0x030028B4
_080A69C0: .4byte 0x0841629C
_080A69C4: .4byte 0x06001000
_080A69C8: .4byte 0x0841627C
_080A69CC: .4byte 0x02023C60
_080A69D0: .4byte 0x08418818
_080A69D4: .4byte 0x0000F080
_080A69D8: .4byte 0x06008000
_080A69DC: .4byte TactInfoFx_Thread
