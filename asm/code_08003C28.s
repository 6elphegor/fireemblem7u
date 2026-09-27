	.include "macro.inc"

	.syntax unified

	thumb_func_start MakeBgmOverridePersist
MakeBgmOverridePersist: @ 0x08003C28
	push {r7, lr}
	mov r7, sp
	ldr r1, _08003C40 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003C44
	b _08003C66
	.align 2, 0
_08003C40: .4byte 0x0202BBF8
_08003C44:
	ldr r0, _08003C6C @ =0x02024E1C
	ldr r1, _08003C6C @ =0x02024E1C
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08003C6C @ =0x02024E1C
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
_08003C66:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003C6C: .4byte 0x02024E1C
