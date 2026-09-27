	.include "macro.inc"

	.syntax unified

	thumb_func_start SioMenu_End
SioMenu_End: @ 0x08042B44
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	mov r1, sp
	ldr r0, _08042B94 @ =0x081D542C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #3
	bl EndFaceById
	adds r5, r6, #0
	adds r5, #0x2c
	movs r4, #4
_08042B62:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge _08042B62
	ldr r1, _08042B98 @ =0x0203D90C
	ldrb r2, [r1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _08042BA0
	bl BMapVSync_End
	bl sub_08047CA8
	bl UnsetBmStLinkArenaFlag
	ldr r0, _08042B9C @ =0x08B9333C
	bl Proc_EndEach
	adds r0, r6, #0
	bl Proc_End
	b _08042BB0
	.align 2, 0
_08042B94: .4byte 0x081D542C
_08042B98: .4byte 0x0203D90C
_08042B9C: .4byte 0x08B9333C
_08042BA0:
	strb r2, [r1, #1]
	ldrb r1, [r1]
	lsls r0, r1, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl Proc_StartBlocking
_08042BB0:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
