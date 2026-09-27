	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E234
sub_0804E234: @ 0x0804E234
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804E258 @ =0x0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804E272
	ldr r0, _0804E25C @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804E272
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804E260
	ldr r0, [r4, #0x5c]
	bl SetEfxDragonDeadFallHead
	b _0804E268
	.align 2, 0
_0804E258: .4byte 0x0201774C
_0804E25C: .4byte 0x0201772C
_0804E260:
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_0804E2E8
_0804E268:
	movs r0, #0x32
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
_0804E272:
	pop {r4}
	pop {r0}
	bx r0
