	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BB2AC
sub_080BB2AC: @ 0x080BB2AC
	push {r4, lr}
	sub sp, #4
	ldr r0, _080BB2FC @ =0x00100010
	str r0, [sp]
	ldr r4, _080BB300 @ =0x02007300
	ldr r2, _080BB304 @ =0x01000080
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080BB308 @ =0x02007500
	str r4, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r4, r1
	str r4, [r0, #4]
	ldr r0, _080BB30C @ =0x02007508
	movs r4, #0
	str r4, [r0]
	bl InitOpScanlineBuf
	ldr r0, _080BB310 @ =0x0200751C
	movs r1, #0xa0
	str r1, [r0]
	ldr r0, _080BB314 @ =0x02007520
	str r1, [r0]
	ldr r1, _080BB318 @ =0x02007018
	str r4, [r1, #0x18]
	movs r0, #0x50
	str r0, [r1, #0x14]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r1, #8]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB2FC: .4byte 0x00100010
_080BB300: .4byte 0x02007300
_080BB304: .4byte 0x01000080
_080BB308: .4byte 0x02007500
_080BB30C: .4byte 0x02007508
_080BB310: .4byte 0x0200751C
_080BB314: .4byte 0x02007520
_080BB318: .4byte 0x02007018
