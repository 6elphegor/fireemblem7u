	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxTeonoObjEnd
EfxTeonoObjEnd: @ 0x08056628
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805664C @ =0x02017754
	movs r0, #0
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl NewEfxTeonoOBJ2
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805664C: .4byte 0x02017754
