	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrTogiInit_LoadGfx
ekrTogiInit_LoadGfx: @ 0x08055648
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _080556A8 @ =0x081DB790
	ldr r1, _080556AC @ =0x06008000
	bl LZ77UnCompVram
	ldr r0, _080556B0 @ =0x081DDDFC
	ldr r6, _080556B4 @ =0x02019784
	adds r1, r6, #0
	bl LZ77UnCompWram
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080556B8 @ =0x0201D41C
	movs r0, #0x2e
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	adds r0, r6, #0
	movs r3, #0x42
	bl EfxTmCpyExt
	movs r0, #0
	bl sub_080554FC
	movs r0, #8
	bl EnableBgSync
	strh r4, [r5, #0x2c]
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x8e
	bl EfxPlaySE
	adds r0, r5, #0
	bl Proc_Break
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080556A8: .4byte 0x081DB790
_080556AC: .4byte 0x06008000
_080556B0: .4byte 0x081DDDFC
_080556B4: .4byte 0x02019784
_080556B8: .4byte 0x0201D41C
