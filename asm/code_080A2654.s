	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMinimapObjectCellAt
GetMinimapObjectCellAt: @ 0x080A2654
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _080A2688 @ =0x0840F950
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r0, _080A268C @ =0x0202E3DC
	ldr r0, [r0]
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2694
	asrs r0, r0, #6
	add r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _080A2690 @ =0x02020140
	adds r0, r0, r1
	b _080A2696
	.align 2, 0
_080A2688: .4byte 0x0840F950
_080A268C: .4byte 0x0202E3DC
_080A2690: .4byte 0x02020140
_080A2694:
	ldr r0, _080A26A0 @ =0x02020140
_080A2696:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A26A0: .4byte 0x02020140
