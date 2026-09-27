	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802020C
sub_0802020C: @ 0x0802020C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl LockBmDisplay
	movs r0, #0x2b
	movs r1, #0
	bl StartBgm
	ldr r4, _08020320 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #3
	movs r1, #0
	bl SetBgChrOffset
	ldr r0, _08020324 @ =0x08402250
	ldr r1, _08020328 @ =0x06001000
	bl Decompress
	ldr r0, _0802032C @ =0x084025A8
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08020330 @ =0x083FF780
	ldr r1, _08020334 @ =0x06002000
	bl Decompress
	ldr r0, _08020338 @ =0x08402588
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl ClearUi
	ldr r0, _0802033C @ =0x02022EAE
	ldr r1, _08020340 @ =0x084025C8
	movs r2, #0x80
	bl TmApplyTsa_thm
	bl PutScreenFogEffectOverlayed
	bl PutScreenFogEffect
	movs r0, #0xc
	bl EnableBgSync
	ldr r0, _08020344 @ =GameOverScreenHBlank
	bl SetOnHBlankA
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _08020348 @ =0x0000FFE0
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0802034C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	bl ColorFadeInit
	ldr r4, _08020350 @ =0x02022860
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl MaybeSmoothChangeSomePal
	adds r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	movs r3, #1
	bl MaybeSmoothChangeSomePal
	adds r5, #0x4c
	movs r0, #0x15
	strh r0, [r5]
	movs r4, #9
_0802030C:
	bl ColorFadeTick_thm
	subs r4, #1
	cmp r4, #0
	bge _0802030C
	bl EnablePalSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020320: .4byte 0x03002870
_08020324: .4byte 0x08402250
_08020328: .4byte 0x06001000
_0802032C: .4byte 0x084025A8
_08020330: .4byte 0x083FF780
_08020334: .4byte 0x06002000
_08020338: .4byte 0x08402588
_0802033C: .4byte 0x02022EAE
_08020340: .4byte 0x084025C8
_08020344: .4byte GameOverScreenHBlank
_08020348: .4byte 0x0000FFE0
_0802034C: .4byte 0x0000E0FF
_08020350: .4byte 0x02022860
