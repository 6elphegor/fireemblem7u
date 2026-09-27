	.include "macro.inc"

	.syntax unified

	thumb_func_start PutMapMetatile
PutMapMetatile: @ 0x080193E0
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	lsls r2, r2, #7
	adds r0, r0, r2
	lsls r1, r1, #2
	adds r5, r0, r1
	ldr r0, _08019444 @ =0x08B932B4
	ldr r0, [r0]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r1, r0, #1
	ldr r0, _08019448 @ =0x02030A90
	adds r2, r1, r0
	ldr r0, _0801944C @ =0x0202E3EC
	ldr r0, [r0]
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r3, #0xb0
	lsls r3, r3, #8
	cmp r0, #0
	beq _0801941A
	movs r3, #0xc0
	lsls r3, r3, #7
_0801941A:
	ldrh r1, [r2]
	adds r0, r1, r3
	strh r0, [r5]
	adds r2, #2
	ldrh r4, [r2]
	adds r0, r4, r3
	strh r0, [r5, #2]
	adds r2, #2
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r4, [r2]
	adds r0, r4, r3
	strh r0, [r1]
	adds r1, #2
	ldrh r2, [r2, #2]
	adds r0, r2, r3
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019444: .4byte 0x08B932B4
_08019448: .4byte 0x02030A90
_0801944C: .4byte 0x0202E3EC
