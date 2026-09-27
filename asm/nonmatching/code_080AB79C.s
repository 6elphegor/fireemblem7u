	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AB79C
sub_080AB79C: @ 0x080AB79C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetTextFont
	bl ResetText
	bl ApplySystemObjectsGraphics
	bl UnpackUiWindowFrameGraphics
	bl InitSystemTextFont
	ldr r7, _080ABA64 @ =0x03002870
	movs r6, #1
	ldrb r2, [r7, #1]
	orrs r2, r6
	movs r0, #2
	orrs r2, r0
	movs r1, #4
	orrs r2, r1
	movs r3, #8
	orrs r2, r3
	movs r0, #0x10
	orrs r2, r0
	subs r1, #8
	adds r0, r1, #0
	ldrb r3, [r7, #0xc]
	ands r0, r3
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r3, [r7, #0x10]
	ands r0, r3
	movs r3, #2
	orrs r0, r3
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r2, r0
	subs r3, #0x43
	ands r2, r3
	movs r0, #0x7f
	ands r2, r0
	strb r2, [r7, #1]
	movs r0, #0
	bl SetBlankChr
	ldr r0, _080ABA68 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r1, _080ABA6C @ =0x02023460
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl TmFill
	ldr r0, _080ABA70 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _080ABA74 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	adds r0, r4, #0
	adds r0, #0x35
	movs r5, #0
	strb r5, [r0]
	adds r0, #2
	strb r5, [r0]
	movs r2, #0
	mov sb, r2
	strh r5, [r4, #0x2a]
	adds r0, #4
	mov r3, sb
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r0, #0xf
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r3, [r0]
	strh r5, [r4, #0x2c]
	adds r0, #0x11
	strb r3, [r0]
	adds r0, r4, #0
	bl sub_080AAE40
	adds r0, r4, #0
	bl sub_080AB440
	bl sub_080AC2C0
	adds r0, r4, #0
	bl TryDrawSoundRoomSongTitle
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #2
	bl DisplaySysHandCursorTextShadow
	adds r0, r4, #0
	bl StartUiSpinningArrows
	movs r1, #0xd0
	lsls r1, r1, #3
	movs r0, #1
	movs r2, #3
	bl LoadUiSpinningArrowGfx
	movs r0, #0x90
	movs r1, #0x38
	movs r2, #0x90
	movs r3, #0x90
	bl SetUiSpinningArrowPositions
	adds r0, r4, #0
	bl sub_080AB5AC
	adds r0, r4, #0
	bl sub_080AB5DC
	adds r0, r4, #0
	bl sub_080AB654
	ldr r0, _080ABA78 @ =0x08413D6C
	ldr r1, _080ABA7C @ =0x06004000
	bl Decompress
	ldr r0, _080ABA80 @ =0x083FCBAC
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080ABA84 @ =0x083FCBCC
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	str r5, [sp]
	movs r0, #2
	movs r1, #1
	movs r2, #0x1a
	movs r3, #6
	bl DrawUiFrame2
	str r5, [sp]
	movs r0, #0xb
	movs r1, #7
	movs r2, #0x11
	movs r3, #0xc
	bl DrawUiFrame2
	str r5, [sp]
	movs r0, #2
	movs r1, #0xb
	movs r2, #9
	movs r3, #8
	bl DrawUiFrame2
	movs r0, #0xb1
	lsls r0, r0, #2
	add r0, sl
	ldr r1, _080ABA88 @ =0x08414884
	movs r2, #0x80
	lsls r2, r2, #5
	mov r8, r2
	bl TmApplyTsa_thm
	str r5, [sp]
	movs r0, #2
	movs r1, #7
	movs r2, #9
	movs r3, #4
	bl DrawUiFrame2
	movs r3, #0xb6
	lsls r3, r3, #1
	add sl, r3
	ldr r1, _080ABA8C @ =0x08414918
	mov r0, sl
	mov r2, r8
	bl TmApplyTsa_thm
	ldr r1, _080ABA68 @ =0x02022C60
	movs r2, #0xb6
	lsls r2, r2, #1
	adds r0, r1, r2
	adds r1, r4, #0
	bl sub_080AB75C
	ldr r2, _080ABA90 @ =0x0000FFFE
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldr r1, _080ABA94 @ =0x0000FFFC
	movs r0, #2
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x20
	ldrb r3, [r7, #1]
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r2, #0x7f
	ands r0, r2
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	orrs r0, r6
	movs r3, #2
	orrs r0, r3
	movs r2, #4
	orrs r0, r2
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	subs r1, #7
	movs r0, #4
	strb r0, [r1]
	adds r1, #4
	movs r5, #0x40
	movs r0, #0x40
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x90
	strb r0, [r1]
	adds r1, #6
	ldrb r3, [r1]
	orrs r6, r3
	movs r0, #2
	orrs r6, r0
	subs r0, #7
	ands r6, r0
	movs r2, #8
	orrs r6, r2
	movs r3, #0x10
	orrs r6, r3
	strb r6, [r1]
	adds r0, r4, #0
	bl sub_080AB548
	movs r1, #0x80
	lsls r1, r1, #8
	str r0, [sp]
	ldr r0, _080ABA74 @ =0x02024460
	movs r2, #8
	movs r3, #8
	bl PutCgBackground
	ldr r0, _080ABA98 @ =0x08413F00
	ldr r1, _080ABA9C @ =0x06012000
	bl Decompress
	ldr r0, _080ABAA0 @ =0x08414844
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	adds r0, r4, #0
	bl sub_080AC78C
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	orrs r0, r5
	strb r0, [r1]
	adds r1, #8
	movs r0, #0xf
	strb r0, [r1]
	adds r1, #1
	movs r0, #3
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	mov r3, sb
	strb r3, [r0]
	ldr r0, _080ABAA4 @ =0x0000FFE0
	ldrh r1, [r7, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080ABAA8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	adds r0, r4, #0
	bl StartGreenText
	bl InitSoundRoomVolumeGraph
	ldr r0, _080ABAAC @ =sub_080AB78C
	adds r1, r4, #0
	bl StartParallelWorker
	ldr r0, _080ABAB0 @ =0x08CE54B4
	adds r1, r4, #0
	bl Proc_Start
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABA64: .4byte 0x03002870
_080ABA68: .4byte 0x02022C60
_080ABA6C: .4byte 0x02023460
_080ABA70: .4byte 0x02023C60
_080ABA74: .4byte 0x02024460
_080ABA78: .4byte 0x08413D6C
_080ABA7C: .4byte 0x06004000
_080ABA80: .4byte 0x083FCBAC
_080ABA84: .4byte 0x083FCBCC
_080ABA88: .4byte 0x08414884
_080ABA8C: .4byte 0x08414918
_080ABA90: .4byte 0x0000FFFE
_080ABA94: .4byte 0x0000FFFC
_080ABA98: .4byte 0x08413F00
_080ABA9C: .4byte 0x06012000
_080ABAA0: .4byte 0x08414844
_080ABAA4: .4byte 0x0000FFE0
_080ABAA8: .4byte 0x0000E0FF
_080ABAAC: .4byte sub_080AB78C
_080ABAB0: .4byte 0x08CE54B4
