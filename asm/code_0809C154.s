	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809C154
sub_0809C154: @ 0x0809C154
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov r8, r0
	ldr r7, _0809C310 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r7]
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	movs r2, #3
	ldrb r0, [r7, #0x10]
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	ldrb r6, [r7, #0x18]
	orrs r2, r6
	strb r2, [r7, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	ldr r0, _0809C314 @ =0x0841629C
	ldr r1, _0809C318 @ =0x06000400
	bl Decompress
	ldr r0, _0809C31C @ =0x0841627C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	str r0, [sp, #8]
	ldr r4, _0809C320 @ =0x02020140
	ldr r2, _0809C324 @ =0x01000110
	add r0, sp, #8
	adds r1, r4, #0
	bl CpuFastSet
	ldr r1, _0809C328 @ =0x08418818
	ldr r2, _0809C32C @ =0x0000F020
	adds r0, r4, #0
	bl TmApplyTsa_thm
	adds r4, #0x40
	ldr r1, _0809C330 @ =0x02023460
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	movs r0, #7
	bl EnableBgSync
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r2, #0x34
	adds r2, r2, r7
	mov sb, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r6, #0x36
	ldrb r2, [r6, r7]
	orrs r0, r2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	movs r2, #0x20
	orrs r1, r2
	mov r3, sb
	strb r1, [r3]
	orrs r0, r2
	strb r0, [r6, r7]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r4, _0809C334 @ =0x02012990
	ldr r1, _0809C338 @ =0x06004000
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r4, #0
	movs r3, #0
	bl InitTextFont
	adds r0, r4, #0
	bl SetTextFont
	add r6, sp, #0xc
	adds r4, #0x18
	movs r5, #0xb
_0809C2D0:
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809C2D0
	ldr r0, _0809C33C @ =0x02012A90
	movs r1, #8
	bl InitText
	movs r0, #0
	bl SetTextFont
	bl sub_0809C044
	ldr r0, _0809C340 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0809C344
	movs r3, #0x81
	lsls r3, r3, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x29
	movs r1, #0xd8
	movs r2, #0x58
	bl StartTalkFace
	b _0809C356
	.align 2, 0
_0809C310: .4byte 0x03002870
_0809C314: .4byte 0x0841629C
_0809C318: .4byte 0x06000400
_0809C31C: .4byte 0x0841627C
_0809C320: .4byte 0x02020140
_0809C324: .4byte 0x01000110
_0809C328: .4byte 0x08418818
_0809C32C: .4byte 0x0000F020
_0809C330: .4byte 0x02023460
_0809C334: .4byte 0x02012990
_0809C338: .4byte 0x06004000
_0809C33C: .4byte 0x02012A90
_0809C340: .4byte 0x0202BBF8
_0809C344:
	movs r3, #0x81
	lsls r3, r3, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x32
	movs r1, #0xd8
	movs r2, #0x58
	bl StartTalkFace
_0809C356:
	movs r0, #0
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, _0809C3C4 @ =0x0840E830
	ldr r1, _0809C3C8 @ =0x06017000
	bl Decompress
	movs r4, #0
	str r4, [sp, #0xc]
	ldr r1, _0809C3CC @ =0x02022C20
	ldr r2, _0809C3D0 @ =0x01000008
	adds r0, r6, #0
	bl CpuFastSet
	ldr r0, _0809C3D4 @ =0x0840E978
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809C3D8 @ =sub_0809BFCC
	mov r1, r8
	bl StartParallelWorker
	ldr r0, _0809C3DC @ =0x08418C54
	ldr r1, _0809C3E0 @ =0x06017800
	bl Decompress
	ldr r0, _0809C3E4 @ =0x08418D40
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809C3E8 @ =0x08418D60
	ldr r3, _0809C3EC @ =0x0000DBC0
	str r4, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x86
	movs r2, #0x6c
	bl StartSpriteAnimProc
	ldr r0, _0809C3F0 @ =0x00000FC3
	mov r1, r8
	str r0, [r1, #0x30]
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C3C4: .4byte 0x0840E830
_0809C3C8: .4byte 0x06017000
_0809C3CC: .4byte 0x02022C20
_0809C3D0: .4byte 0x01000008
_0809C3D4: .4byte 0x0840E978
_0809C3D8: .4byte sub_0809BFCC
_0809C3DC: .4byte 0x08418C54
_0809C3E0: .4byte 0x06017800
_0809C3E4: .4byte 0x08418D40
_0809C3E8: .4byte 0x08418D60
_0809C3EC: .4byte 0x0000DBC0
_0809C3F0: .4byte 0x00000FC3
