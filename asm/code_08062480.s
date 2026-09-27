	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxDamageMojiEffect
NewEfxDamageMojiEffect: @ 0x08062480
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080624A8 @ =0x08BA41D4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r5, [r0]
	ldr r0, _080624AC @ =0x081D9FDC
	ldr r1, _080624B0 @ =0x06012000
	bl LZ77UnCompVram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080624A8: .4byte 0x08BA41D4
_080624AC: .4byte 0x081D9FDC
_080624B0: .4byte 0x06012000
