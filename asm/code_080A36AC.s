	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcSaveMenu_InitScreen
ProcSaveMenu_InitScreen: @ 0x080A36AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	bl ResetTextFont
	bl ApplySystemObjectsGraphics
	ldr r0, _080A3888 @ =0x0840F9A0
	movs r1, #0
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r4, _080A388C @ =0x08418E44
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A3890 @ =0x02022C60
	ldr r1, _080A3894 @ =0x0840FA00
	movs r2, #0
	bl TmApplyTsa_thm
	ldr r0, _080A3898 @ =0x084138F0
	movs r1, #0x88
	lsls r1, r1, #2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r2, r5, #0
	bl ApplyPaletteExt
	ldr r0, _080A389C @ =0x084139F0
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A38A0 @ =0x08413A10
	ldr r1, _080A38A4 @ =0x02000004
	movs r2, #2
	bl sub_080A5130
	movs r0, #0xf
	bl EnableBgSync
	mov r0, r8
	adds r0, #0x29
	movs r4, #0
	strb r4, [r0]
	ldr r2, _080A38A8 @ =0x03002870
	adds r3, r2, #0
	adds r3, #0x34
	movs r0, #0x20
	ldrb r1, [r3]
	orrs r1, r0
	strb r1, [r3]
	adds r2, #0x35
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080A38AC @ =0x084120A0
	ldr r1, _080A38B0 @ =0x06010800
	bl Decompress
	mov r0, r8
	adds r0, #0x36
	strb r4, [r0]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x3d
	strb r4, [r0]
	bl sub_080A5FD0
	movs r7, #0
	ldr r2, _080A38B4 @ =0x080C5A48
	mov sl, r2
	mov sb, r5
_080A375E:
	ldr r1, _080A38B8 @ =0x080C5AC8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080A38B8 @ =0x080C5AC8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	adds r7, #1
	cmp r7, #3
	ble _080A375E
	mov r1, r8
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	subs r1, #5
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x3e
	strb r2, [r0]
	adds r0, #2
	strb r2, [r0]
	ldr r1, _080A38BC @ =0x02000000
	movs r0, #0x64
	strb r0, [r1]
	ldr r1, _080A38C0 @ =0x02000001
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _080A38C4 @ =SaveMenuOnHBlank
	bl SetOnHBlankA
	ldr r4, _080A38C8 @ =0x0840FEB4
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080A38CC @ =0x02024460
	ldr r1, _080A38D0 @ =0x08411F34
	movs r2, #0
	movs r3, #5
	bl sub_08001F3C
	movs r0, #8
	bl EnableBgSync
	movs r7, #0
	mov r4, r8
	adds r4, #0x2c
_080A381E:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	bl sub_080A6398
	adds r7, #1
	cmp r7, #3
	ble _080A381E
	ldrb r0, [r4]
	bl sub_080A649C
	bl SaveMenuInitSubBoxText
	movs r0, #2
	bl EnableBgSync
	ldr r2, _080A38A8 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _080A38D4 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	mov r0, r8
	bl SaveMenuPutChapterTitle
	mov r0, r8
	bl StartSaveDraw
	mov r2, r8
	str r0, [r2, #0x58]
	mov r0, r8
	bl StartSpinRotation
	mov r1, r8
	str r0, [r1, #0x5c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3888: .4byte 0x0840F9A0
_080A388C: .4byte 0x08418E44
_080A3890: .4byte 0x02022C60
_080A3894: .4byte 0x0840FA00
_080A3898: .4byte 0x084138F0
_080A389C: .4byte 0x084139F0
_080A38A0: .4byte 0x08413A10
_080A38A4: .4byte 0x02000004
_080A38A8: .4byte 0x03002870
_080A38AC: .4byte 0x084120A0
_080A38B0: .4byte 0x06010800
_080A38B4: .4byte 0x080C5A48
_080A38B8: .4byte 0x080C5AC8
_080A38BC: .4byte 0x02000000
_080A38C0: .4byte 0x02000001
_080A38C4: .4byte SaveMenuOnHBlank
_080A38C8: .4byte 0x0840FEB4
_080A38CC: .4byte 0x02024460
_080A38D0: .4byte 0x08411F34
_080A38D4: .4byte 0x02022860
