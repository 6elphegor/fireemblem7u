	.include "macro.inc"

	.syntax unified

	thumb_func_start InitPassword
InitPassword: @ 0x0809DDE4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _0809DECC @ =0x02014434
	ldr r0, _0809DED0 @ =0x02014408
	ldr r0, [r0]
	str r0, [r1]
	ldr r4, _0809DED4 @ =0x020144E0
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #2
	bl sub_0809D880
	ldrb r2, [r4, #1]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_0809D880
	ldrb r2, [r4, #2]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_0809D880
	ldrb r2, [r4, #0xa]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_0809D880
	bl GetGameTime
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #5
	bl sub_0809D880
	ldrb r2, [r4, #3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_0809D880
	ldrb r2, [r4, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_0809D880
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_0809D880
	ldrb r2, [r4, #6]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_0809D880
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_0809D880
	ldrb r2, [r4, #9]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_0809D880
	ldrb r2, [r4, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_0809D880
	ldrh r2, [r4, #0xc]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0xa
	bl sub_0809D880
	ldrb r2, [r4, #0xe]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_0809D880
	ldrb r2, [r4, #0xf]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_0809D880
	ldrb r2, [r4, #0xb]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_0809D880
	ldr r2, [r4, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0x18
	bl sub_0809D880
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809DECC: .4byte 0x02014434
_0809DED0: .4byte 0x02014408
_0809DED4: .4byte 0x020144E0
