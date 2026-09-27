	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearCRSpellBgTmBuf
ClearCRSpellBgTmBuf: @ 0x080640A4
	push {r4, lr}
	sub sp, #4
	bl GetMagicEffectBufferFor
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r1, [r4, #0x14]
	ldr r2, _080640D0 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #1
	ldrh r4, [r4, #0x12]
	lsls r0, r4
	bl EnableBgSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080640D0: .4byte 0x01000200
