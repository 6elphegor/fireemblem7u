	.include "macro.inc"

	.syntax unified

	thumb_func_start Sio_DrawFe6CommImage
Sio_DrawFe6CommImage: @ 0x080431E0
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r6, r0, #0
	ldr r1, _0804337C @ =0x081D5454
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	ldr r3, _08043380 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl sub_08047CA8
	ldr r4, _08043384 @ =0x081D245C
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r2, _08043388 @ =0x06000C00
	adds r1, r1, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0804338C @ =0x081D26E0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08043390 @ =0x081D2700
	ldr r1, _08043394 @ =0x06014000
	bl Decompress
	ldr r0, _08043398 @ =0x081D2B1C
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _0804339C @ =0x02023460
	ldr r1, _080433A0 @ =0x081D258C
	ldr r5, _080433A4 @ =0x00004060
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_thm
	movs r0, #0x88
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r1, _080433A8 @ =0x081D2628
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_thm
	ldr r4, _080433AC @ =0x081CE25C
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080433B0 @ =0x081D1DF8
	ldr r4, _080433B4 @ =0x02024460
	adds r1, r4, #0
	bl Decompress
	ldr r0, _080433B8 @ =0x081D235C
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0xe0
	bl ApplyPaletteExt
	movs r0, #0xe0
	lsls r0, r0, #7
	adds r1, r0, #0
	movs r5, #0xa0
	lsls r5, r5, #2
_080432AC:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _080432AC
	ldr r0, _080433BC @ =0x08B99870
	adds r1, r6, #0
	bl Proc_Start
	ldr r0, _080433C0 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	ldr r4, _080433C4 @ =0x0203DC08
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r0, _080433C8 @ =0x0000118D
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _080433CC @ =0x020230EE
	adds r0, r4, #0
	bl PutText
	movs r0, #0xb
	bl EnableBgSync
	movs r0, #0
	movs r1, #0
	movs r2, #4
	bl SetBgOffset
	ldr r3, _08043380 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _080433D0 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	ldr r1, _080433D4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl SoundVSyncOff_rev01
	ldr r0, _080433D8 @ =0x030046B0
	ldr r1, _080433DC @ =0x08CF0CD0
	str r1, [r0]
	ldr r2, _080433E0 @ =0x0300474C
	ldr r0, _080433E4 @ =0x08CF634C
	subs r0, r0, r1
	str r0, [r2]
	ldr r0, _080433E8 @ =0x03004750
	str r1, [r0, #0x28]
	adds r1, r0, #0
	adds r1, #0x4b
	strb r5, [r1]
	bl MultiBootInit
	ldr r0, _080433EC @ =0x08B98AEC
	ldr r1, [r0]
	movs r0, #4
	strb r0, [r1, #0xb]
	adds r0, r6, #0
	adds r0, #0x64
	strh r5, [r0]
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804337C: .4byte 0x081D5454
_08043380: .4byte 0x03002870
_08043384: .4byte 0x081D245C
_08043388: .4byte 0x06000C00
_0804338C: .4byte 0x081D26E0
_08043390: .4byte 0x081D2700
_08043394: .4byte 0x06014000
_08043398: .4byte 0x081D2B1C
_0804339C: .4byte 0x02023460
_080433A0: .4byte 0x081D258C
_080433A4: .4byte 0x00004060
_080433A8: .4byte 0x081D2628
_080433AC: .4byte 0x081CE25C
_080433B0: .4byte 0x081D1DF8
_080433B4: .4byte 0x02024460
_080433B8: .4byte 0x081D235C
_080433BC: .4byte 0x08B99870
_080433C0: .4byte 0x0203DA60
_080433C4: .4byte 0x0203DC08
_080433C8: .4byte 0x0000118D
_080433CC: .4byte 0x020230EE
_080433D0: .4byte 0x0000FFE0
_080433D4: .4byte 0x0000E0FF
_080433D8: .4byte 0x030046B0
_080433DC: .4byte 0x08CF0CD0
_080433E0: .4byte 0x0300474C
_080433E4: .4byte 0x08CF634C
_080433E8: .4byte 0x03004750
_080433EC: .4byte 0x08B98AEC
