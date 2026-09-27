	.include "macro.inc"

	.syntax unified

	thumb_func_start SioMenu_Init
SioMenu_Init: @ 0x08042464
	push {lr}
	bl CheckSomethingSaveRelated
	ldr r1, _08042490 @ =0x0203D90C
	strb r0, [r1, #0xa]
	ldr r1, _08042494 @ =0x0203DC28
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1e
_08042476:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _08042476
	movs r1, #0
	ldr r3, _08042498 @ =0x030013F0
	ldr r2, _0804249C @ =0x030013F4
	ldr r0, _080424A0 @ =0x0203DC48
	str r1, [r0]
	str r1, [r2]
	str r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08042490: .4byte 0x0203D90C
_08042494: .4byte 0x0203DC28
_08042498: .4byte 0x030013F0
_0804249C: .4byte 0x030013F4
_080424A0: .4byte 0x0203DC48
