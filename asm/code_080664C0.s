	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonFireBg3
NewEkrDragonFireBg3: @ 0x080664C0
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0806652C @ =0x08BD9578
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r0, _08066530 @ =0x082E4164
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08066534 @ =0x082E4B54
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _08066538 @ =0x082E4B74
	ldr r4, _0806653C @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08066540 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806652C: .4byte 0x08BD9578
_08066530: .4byte 0x082E4164
_08066534: .4byte 0x082E4B54
_08066538: .4byte 0x082E4B74
_0806653C: .4byte 0x02019784
_08066540: .4byte 0x02023460
