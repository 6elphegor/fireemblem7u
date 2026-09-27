	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvup_PrepareApGfx
EkrLvup_PrepareApGfx: @ 0x08069570
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa0
	movs r1, #1
	bl NewEkrLvupApfx
	ldr r1, _08069598 @ =0x020200B0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1c
_08069584:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _08069584
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069598: .4byte 0x020200B0
