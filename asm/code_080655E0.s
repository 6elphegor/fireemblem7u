	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonBaseAppear
NewEkrDragonBaseAppear: @ 0x080655E0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08065634 @ =0x08BD93C0
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	strh r1, [r5, #0x2c]
	ldr r0, _08065638 @ =0x02023C60
	str r1, [sp]
	movs r1, #0x20
	movs r2, #0x20
	movs r3, #0
	bl FillBGRect
	ldr r0, _0806563C @ =0x0201FAD0
	bl sub_08054F30
	ldr r4, _08065640 @ =0x020228E0
	ldr r1, _08065644 @ =0x02020060
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	movs r3, #0x10
	bl EfxPalBlackInOut
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065634: .4byte 0x08BD93C0
_08065638: .4byte 0x02023C60
_0806563C: .4byte 0x0201FAD0
_08065640: .4byte 0x020228E0
_08065644: .4byte 0x02020060
