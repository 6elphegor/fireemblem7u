	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonFireBG2
NewEkrDragonFireBG2: @ 0x08065B04
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _08065B68 @ =0x08BD9480
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, _08065B6C @ =0x082E4D30
	ldr r1, _08065B70 @ =0x06005000
	bl LZ77UnCompVram
	ldr r0, _08065B74 @ =0x082E58BC
	ldr r6, _08065B78 @ =0x02019784
	adds r1, r6, #0
	bl LZ77UnCompWram
	ldr r0, _08065B7C @ =0x082E589C
	ldr r1, _08065B80 @ =0x020228E0
	movs r2, #8
	bl CpuFastSet
	ldr r4, _08065B84 @ =0x02023C60
	adds r0, r4, #0
	movs r1, #0x1f
	bl TmFill
	movs r0, #4
	str r0, [sp]
	movs r0, #0xa0
	lsls r0, r0, #2
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #4
	bl EnableBgSync
	adds r0, r5, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08065B68: .4byte 0x08BD9480
_08065B6C: .4byte 0x082E4D30
_08065B70: .4byte 0x06005000
_08065B74: .4byte 0x082E58BC
_08065B78: .4byte 0x02019784
_08065B7C: .4byte 0x082E589C
_08065B80: .4byte 0x020228E0
_08065B84: .4byte 0x02023C60
