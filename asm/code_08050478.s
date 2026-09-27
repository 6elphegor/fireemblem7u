	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxCreateBackAnim
EfxCreateBackAnim: @ 0x08050478
	push {r4, lr}
	sub sp, #8
	adds r3, r0, #0
	ldr r0, _080504AC @ =0x0203E02C
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r4, r2, #0
	cmp r0, #0
	bne _0805048C
	adds r4, r1, #0
_0805048C:
	adds r0, r3, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080504B4
	ldr r1, _080504B0 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _080504C8
	.align 2, 0
_080504AC: .4byte 0x0203E02C
_080504B0: .4byte 0x02023460
_080504B4:
	ldr r1, _080504D8 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_080504C8:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080504D8: .4byte 0x02023460
