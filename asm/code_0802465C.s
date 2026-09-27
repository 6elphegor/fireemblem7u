	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802465C
sub_0802465C: @ 0x0802465C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024684 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024688 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _0802468C @ =sub_0802460C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024684: .4byte 0x02033E40
_08024688: .4byte 0x0202E3E8
_0802468C: .4byte sub_0802460C
