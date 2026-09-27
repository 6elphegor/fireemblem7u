	.include "macro.inc"

	.syntax unified

	thumb_func_start ShouldDisplayUpArrow
ShouldDisplayUpArrow: @ 0x080B25D0
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B25E4 @ =0x08CE7298
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	cmp r1, #0
	beq _080B25E8
	movs r0, #1
	b _080B25EC
	.align 2, 0
_080B25E4: .4byte 0x08CE7298
_080B25E8:
	movs r0, #0
	b _080B25EC
_080B25EC:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
