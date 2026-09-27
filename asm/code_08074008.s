	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08074008
sub_08074008: @ 0x08074008
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _080740A4 @ =0x02023460
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r5, _080740A8 @ =0x081DAFEC
	movs r0, #1
	bl GetBgChrOffset
	ldr r2, _080740AC @ =0x06004000
	adds r1, r0, r2
	adds r0, r5, #0
	bl Decompress
	ldr r0, _080740B0 @ =0x081DB238
	ldr r1, _080740B4 @ =0x02020140
	bl Decompress
	ldr r0, _080740B4 @ =0x02020140
	ldr r1, _080740A4 @ =0x02023460
	movs r2, #0xe0
	lsls r2, r2, #2
	movs r3, #0xa4
	lsls r3, r3, #7
	bl PutTmLinear
	ldr r1, _080740B8 @ =0x081DB334
	adds r0, r1, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r7, #8]
	lsls r0, r1, #5
	adds r1, r0, #1
	ldr r2, [r7, #4]
	adds r0, r1, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _080740BC @ =0x02022C60
	adds r5, r0, r1
	ldr r0, _080740C0 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl PutString
	movs r0, #0
	str r0, [r7, #0xc]
_0807408E:
	ldr r0, _080740C4 @ =0x08C9DDB4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _080740C8
	b _0807415C
	.align 2, 0
_080740A4: .4byte 0x02023460
_080740A8: .4byte 0x081DAFEC
_080740AC: .4byte 0x06004000
_080740B0: .4byte 0x081DB238
_080740B4: .4byte 0x02020140
_080740B8: .4byte 0x081DB334
_080740BC: .4byte 0x02022C60
_080740C0: .4byte 0x0203E0FC
_080740C4: .4byte 0x08C9DDB4
_080740C8:
	ldr r0, _0807412C @ =0x08C9DDB4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	ldr r0, [r7, #8]
	adds r1, r1, r0
	lsls r0, r1, #5
	ldr r1, _0807412C @ =0x08C9DDB4
	ldr r2, [r7, #0xc]
	adds r5, r2, #0
	lsls r3, r5, #1
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1]
	ldr r3, [r7, #4]
	adds r1, r2, r3
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08074130 @ =0x02022C60
	adds r5, r0, r1
	ldr r6, _0807412C @ =0x08C9DDB4
	ldr r0, [r7, #0xc]
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r0
	lsls r0, r1, #2
	adds r4, r0, #0
	ldr r0, _08074134 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl UnitHasMagicRank
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #1
	bne _08074138
	adds r0, r4, #4
	b _0807413A
	.align 2, 0
_0807412C: .4byte 0x08C9DDB4
_08074130: .4byte 0x02022C60
_08074134: .4byte 0x0203E0FC
_08074138:
	adds r0, r4, #0
_0807413A:
	adds r1, r6, #4
	adds r0, r1, r0
	ldr r1, [r0]
	ldr r2, [r1]
	adds r0, r2, #0
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #3
	movs r2, #3
	bl PutStringCentered
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0807408E
_0807415C:
	movs r0, #3
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
