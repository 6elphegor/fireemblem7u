	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080255E0
sub_080255E0: @ 0x080255E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r0, #0
	bne _080255FA
	ldr r2, _08025644 @ =0x02033F14
_080255FA:
	cmp r0, #0x20
	bne _08025600
	ldr r2, _08025648 @ =0x02035F14
_08025600:
	cmp r0, #0x24
	bne _08025606
	ldr r2, _0802564C @ =0x02037F14
_08025606:
	cmp r1, #0x44
	bne _0802560C
	ldr r2, _08025648 @ =0x02035F14
_0802560C:
	cmp r2, #0
	beq _0802563C
	ldr r1, _08025650 @ =0x08B93E48
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #5
	adds r1, r5, #0
	adds r1, #0x20
	adds r5, r0, r1
	adds r4, r0, r2
	movs r6, #3
_08025624:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _08025624
_0802563C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025644: .4byte 0x02033F14
_08025648: .4byte 0x02035F14
_0802564C: .4byte 0x02037F14
_08025650: .4byte 0x08B93E48
